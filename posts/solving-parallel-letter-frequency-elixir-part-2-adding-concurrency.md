# 2. What Parallel Letter Frequency can teach you about concurrency with Elixir’s `Task` module

Exercises on Exercism are small, synthetic, and often seemingly trivial. It’s easy to imagine that experienced practitioners would have nothing to learn from them. However, solving these synthetic problems can push you to learn and apply parts of your language that you may not have explored. This new learning can lead you to solve real world problems more efficiently or in a more expressive way.

[Parallel Letter Frequency](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency) is a medium difficulty exercise on [Exercism's Elixir Track](https://exercism.io/tracks/elixir). It asks you to write a function that calculates the frequency of letters in a list of strings, and to do so concurrently. This unpacks a surprising number of interesting lessons.

```elixir
iex> Frequency.frequency(["Freude", "schöner", "Götterfunken"], num_workers)
%{
  "c" => 1, 
  "d" => 1, 
  "e" => 5, 
  ...
  "ö" => 2
}
```

Luckily for all the Alchemists out there, Elixir has some core features that make solving this problem relatively simple. But -- if you're like me -- you might have never used them prior to starting this problem. Elixir's `Task` module makes writing concurrent code unbelievably easy and clean, and I found it crucial for solving this Exercism problem. In this post I'll walk you through how I applied the `Task` module to add concurrency to my solution.

## How to make your code concurrent using the `Task` module

Adding concurrency was a major challenge in solving this problem. The function is required to do the letter frequency calculation by distributing the work to a number of worker processes, which the user can set with the `workers` argument.

While Elixir allows you to very easily spawn processes with functions like [`Kernel.spawn_link/1`](https://hexdocs.pm/elixir/Kernel.html#spawn_link/1), you're much better off using the awesomely powerful abstractions provided by the [`Task` module](https://hexdocs.pm/elixir/Task.html):

> The most common use case for [Task] is to convert sequential code into concurrent code by computing a value asynchronously.

The `Task` module lets you write [unbelievably clean concurrent code](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/clean-concurrent-code-elixir-task-module/) in Elixir -- no [callback hell](http://callbackhell.com/) and no need for [Promises](https://javascript.info/promise-basics). 

I decided that [`Task.async_stream/5`](https://hexdocs.pm/elixir/Task.html#async_stream/5) was the best option in the `Task` toolbox for this particular problem:

```elixir
async_stream(enumerable, module, function, args, options \\ [])
```

`Task.async_stream/5` returns a stream that runs the given `module`, `function`, and `args` concurrently on each item in `enumerable`. There are two ways to control the level of concurrency with `Task.async_stream/5`:

1. The number of items in `enumerable`, which determines the number of workers spawned (in the absence of the `:max_concurrency` option)
2. Setting the `:max_concurrency` option to the number of workers, given that the number of items in `enumerable` is greater than or equal to `:max_concurrency`

I chose the first option for my solution since it was the easiest for me to understand and also meant that I could ensure that the correct number of workers was used even for very short strings. Here's a diagram of my approach to adding concurrency to this problem:

{{< figure src="/images/articles/elixir-parallel-letter-frequency/exercism-elixir-parallel-letter-concurrency.png" alt="Making the letter frequency computation concurrent" >}}

Or in words:

1. Split up a list of graphemes into a number of chunks (equal to the number of workers)
2. Process each chunk in a worker using `Task.async_stream/5`
3. Merge the results from each worker into a single result

My implementation using `Task.async_stream/5` is shown below (using the `count_letters/1` function from the previous post). Notice how this reads exactly like regular sequential code despite potentially massive concurrency. Such is the power of the abstractions provided in `Task`:

```elixir
def frequency(texts, workers) do
  texts
  |> get_all_graphemes()
  |> split_into_chunks(workers)
  |> Task.async_stream(__MODULE__, :count_letters, [])
  |> merge_results_stream()
end

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

## Conclusion

Once I discovered the awesomely powerful `Task` module, adding concurrency to the solution turned out to be easier than expected. The concurrent code added some extra complexity because it needs to split up the list of graphemes and combine the results from all the workers, but even by my standards I would say that the end result is surprisingly clean. 

I hope you've seen how useful `Task` is when it comes to writing clean concurrent code in Elixir, and maybe you even got some ideas about how you might use the functions in `Task` in your own application. Just remember that concurrency won't always increase the speed of your code, so please make sure to test the performance impact of any changes you make.

✅ [View my published solution on Exercism](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952).

