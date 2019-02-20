Exercises on Exercism are small, synthetic, and often seemingly trivial. It’s easy to imagine that experienced practitioners would have nothing to learn from them. However, solving these synthetic problems can push you to learn and apply parts of your language that you may not have explored. This new learning can lead you to solve real world problems more efficiently or in a more expressive way.

[Parallel Letter Frequency](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency) is a medium difficulty exercise on [Exercism's Elixir Track](https://exercism.io/tracks/elixir) that unpacks a surprising number of interesting lessons. One of those lessons is how easy it is to add concurrency to Elixir code with core features alone, which has clear benefits for anyone writing applications whose performance could be improved by parallelizing tasks. 

This exercise requires you to implement a `Frequency.frequency/2` function that determines letter frequency in a list of strings, with the added challenge of distributing the calculation to a number of worker processes, set with the `workers` argument:

```elixir
iex> Frequency.frequency(["Freude", "schöner", "Götterfunken"], workers)
%{
  "c" => 1, 
  "d" => 1, 
  "e" => 5, 
  ...
  "ö" => 2
}
```

Let's explore how we can add concurrency to our solution using Elixir.

## Writing concurrent Elixir code with the `Task` module

A big selling point of Elixir is its scalability, which comes as a result of all Elixir code running concurrently in [Erlang VM](https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine)) processes. You can very easily spawn processes with functions like [`Kernel.spawn_link/1`](https://hexdocs.pm/elixir/Kernel.html#spawn_link/1), but if concurrency is the goal, you're much better off using the awesomely powerful abstractions provided by the [`Task` module](https://hexdocs.pm/elixir/Task.html):

> The most common use case for [Task] is to convert sequential code into concurrent code by computing a value asynchronously.

The `Task` module lets you write unbelievably clean concurrent code in Elixir -- no [callback hell](http://callbackhell.com/) and no need for [Promises](https://javascript.info/promise-basics). 

For the problem at hand, [`Task.async_stream/5`](https://hexdocs.pm/elixir/Task.html#async_stream/5) is a great option:

```elixir
async_stream(enumerable, module, function, args, options \\ [])
```

`Task.async_stream/5` returns a stream that runs the given `module`, `function`, and `args` concurrently on each item in `enumerable`. There are two ways to control the level of concurrency with `Task.async_stream/5`:

1. The number of items in `enumerable`, which determines the number of workers spawned (in the absence of the `:max_concurrency` option)
2. Setting the `:max_concurrency` option to the number of workers, given that the number of items in `enumerable` is greater than or equal to `:max_concurrency`

The first option is simple and easy to understand, and lets you ensure the correct number of workers is used even for short strings. 

## Make the letter frequency calculation concurrent

Here's a diagram of how you could apply `Task.async_stream/5` to parallelize the letter frequency calculation:

![Making the letter frequency computation concurrent](https://www.toptechskills.com/images/articles/elixir-parallel-letter-frequency/exercism-elixir-parallel-letter-concurrency.png)

Or in words:

1. Split up a list of graphemes into a number of chunks (equal to the number of workers)
2. Process each chunk in a worker using `Task.async_stream/5`
3. Merge the results from each worker into a single result

Let's take a look at a working sequential implementation based on [my solution](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952) and then parallelize it with `Task.async_stream/5`:

```elixir
def frequency(texts, _workers) do
  texts
  |> get_all_graphemes()
  |> count_letters()
end

def count_letters(graphemes) do
  Enum.reduce(graphemes, %{}, fn grapheme, acc ->
    if String.match?(grapheme, ~r/^\p{L}$/u) do
      downcased_letter = String.downcase(grapheme)
      Map.update(acc, downcased_letter, 1, fn count -> count + 1 end)
    else
      acc
    end
  end)
end

defp get_all_graphemes(texts) do
  texts
  |> Enum.join()
  |> String.graphemes()
end
```

Based on the diagram above, we only need to add 2 new functions: one to split the graphemes into chunks and one to merge the results from each worker. Here's one way to implement those functions:

```elixir
defp split_into_chunks(all_graphemes, num_chunks) do
  all_graphemes_count = Enum.count(all_graphemes)
  graphemes_per_chunk = :erlang.ceil(all_graphemes_count / num_chunks)

  Enum.chunk_every(all_graphemes, graphemes_per_chunk)
end

defp merge_results_stream(results_stream) do
  Enum.reduce(results_stream, %{}, fn {:ok, worker_result}, acc ->
    Map.merge(acc, worker_result, fn _key, acc_val, worker_val ->
      acc_val + worker_val
    end)
  end)
end
```

With those 2 functions implemented, all that's left to do to make the `frequency/2` function run concurrently is to change the direct call to `count_letters/1` with `Task.async_stream(__MODULE__, :count_letters, [])`, and add the helper functions before and after:

```elixir
def frequency(texts, workers) do
  texts
  |> get_all_graphemes()
  |> split_into_chunks(workers)
  |> Task.async_stream(__MODULE__, :count_letters, [])
  |> merge_results_stream()
end
```

Notice how this working concurrent solution reads exactly like regular sequential code despite potentially massive concurrency. This is a really clear demonstration of the power of the abstractions provided in `Task`.

## Conclusion

Adding concurrency to this solution turns out to be much easier than expected using Elixir's `Task` module. The concurrent code adds some extra complexity in the splitting of the list of graphemes and combining the worker results, but the end result is surprisingly clean. 

Prior to solving this Exercism problem I had heard about `Task`, but never used it. After applying it in my solution, I would now consider it an indispensable part of my Elixir toolbox. 

You could use this new tool in a number of ways to try to optimize performance in your own applications. One fairly reliable way to speed up a web application would be to [parallelize HTTP requests](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/clean-concurrent-code-elixir-task-module/) to reduce the time spent making multiple independent API calls:

```elixir
def call_apis_async() do
  @api_urls
  |> Task.async_stream(&HTTPoison.get/1)
  |> Enum.into([], fn {:ok, res} -> res end)
end
```
