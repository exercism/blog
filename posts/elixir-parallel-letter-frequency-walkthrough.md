In this post I'll walk you through how I solved the [Parallel Letter Frequency problem](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency) on [Exercism's Elixir Track](https://exercism.io/tracks/elixir). This is a medium difficulty problem that I found really interesting to solve, and it's a great opportunity to show how you can add concurrency to your [Elixir](https://elixir-lang.org/) code with the [`Task` module](https://hexdocs.pm/elixir/Task.html).

![The Parallel Letter Frequency problem on Exercism's Elixir track](https://www.toptechskills.com/images/articles/elixir-parallel-letter-frequency/exercism-elixir-parallel-letter-frequency-problem-d1259402e7.png)

✅ [View my published solution on Exercism](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952).

The concurrent version of the code ran around **80% faster** on my system for certain workloads, but in some cases was over **3x slower than the original code**. As the benchmarks later in the post demonstrate, depending on the situation, adding concurrency can actually **reduce performance while also increasing the complexity of your code**.

## The problem

I need to implement a function that counts the frequency of letters in a list of strings and distributes the workload to a number of worker processes. The number of workers should be passed in as argument and the final implementation should work like this:

```elixir
iex> Frequency.frequency(["abc", "aabbcc", "aaabbbccc"], num_workers)
%{"a" => 6, "b" => 6, "c" => 6}
```

To help me solve this problem, I'll break it down into 2 steps:

1. Create a function that meets the specification (i.e. passes the tests) without any concurrency
2. Make the function concurrent while keeping the tests passing

Once I've passed all the tests with the concurrent code, I'll benchmark it to check if it's actually faster.

## Create a function that counts letter frequency in a list of strings

The bulk of this problem is taking a list of strings and counting the letters inside all of them while ignoring case (`A` should be counted as `a`).

Representing the function as a black box, I see something like this:

```plaintext
["A, b, C", "a, B, C"] => [ frequency/2 ] => %{"a" => 2, "b" => 2, "c" => 2}
```

My approach to the implementation will be to get a list of all the individual characters/graphemes in all the strings and then count which graphemes are letters.

I'll start by fleshing this out with some dummy functions:

```elixir
def frequency(texts, _workers) do
  texts
  |> get_all_graphemes()
  |> count_letters()
end

defp get_all_graphemes(texts) do
  # TODO: extract all graphemes from all texts
  texts
end

defp count_letters(graphemes) do
  # TODO: count all letters (case insensitive)
  graphemes
end
```

### Get all the individual graphemes from all the strings

My approach to this is to first join all the strings together using [`Enum.join/2`](https://hexdocs.pm/elixir/Enum.html#join/2), then get all the characters out with [`String.graphemes/1`](https://hexdocs.pm/elixir/String.html#graphemes/1):

```elixir
defp get_all_graphemes(texts) do
  texts
  |> Enum.join()
  |> String.graphemes()
end
```

Running the code at this point gives the following output:

```elixir
iex> Frequency.frequency(["A, b, C", "a, B, C"], 1)
["A", ",", " ", "b", ",", " ", "C", "a", ",", " ", "B", ",", " ", "C"]
```

### Count all the letters in a list of graphemes

The heavy lifting will be done by `count_letters/1`, which will receive a list of all the individual graphemes and count only the letters while ignoring case.

I know that I'll need to use [`Enum.reduce/3`](https://hexdocs.pm/elixir/Enum.html#reduce/3) to do this, so I can go ahead and add it to the implementation with pseudocode comments right away:

```elixir
defp count_letters(graphemes) do
  Enum.reduce(graphemes, %{}, fn grapheme, acc ->
    # if the grapheme is a letter
      # downcase the letter
      # increment the count of the downcased letter

    # else
      # do nothing, return acc
  end)
end
```

I'm going to use a regular expression to determine whether or not a grapheme is a letter. Looking at the tests, I can see that one of the texts is in German and has non-English letters like `ö`:

```elixir
# parallel_letter_frequency_test.exs

@ode_an_die_freude """
Freude schöner Götterfunken
...
"""
```

This means I can't simply use the regular expression `~r/^[a-z]$/i` to determine whether or not a grapheme is a letter:

```elixir
iex> String.match?("ö", ~r/[a-z]/i)
false
```

Luckily [Elixir's `Regex` module](https://hexdocs.pm/elixir/Regex.html) allows Unicode matches with the `u` option, which means I can [match any single Unicode letter in Elixir](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/how-to-match-any-unicode-letter-with-regex-elixir/) by using `~r/^\p{L}$/u`: 

```elixir
iex> String.match?("ö", ~r/^\p{L}$/u)
true

iex> String.match?("&", ~r/^\p{L}$/u)
false
```

All that's left to do is downcase the letter and increment the count in `acc`. I'll use [`String.downcase/2`](https://hexdocs.pm/elixir/String.html#downcase/2) and [`Map.update/4`](https://hexdocs.pm/elixir/Map.html#update/4) to do this:

```elixir
defp count_letters(graphemes) do
  Enum.reduce(graphemes, %{}, fn grapheme, acc ->
    if String.match?(grapheme, ~r/^\p{L}$/u) do
      downcased_letter = String.downcase(grapheme)
      Map.update(acc, downcased_letter, 1, fn count -> count + 1 end)
    else
      acc
    end
  end)
end
```

### Final non-concurrent code

With `get_all_graphemes/1` and `count_letters/1` complete, the non-concurrent implementation looks like this:

```elixir
def frequency(texts, _workers) do
  texts
  |> get_all_graphemes()
  |> count_letters()
end

defp get_all_graphemes(texts) do
  texts
  |> Enum.join()
  |> String.graphemes()
end

defp count_letters(graphemes) do
  Enum.reduce(graphemes, %{}, fn grapheme, acc ->
    if String.match?(grapheme, ~r/^\p{L}$/u) do
      downcased_letter = String.downcase(grapheme)
      Map.update(acc, downcased_letter, 1, fn count -> count + 1 end)
    else
      acc
    end
  end)
end
```

This implementation passes all the tests, so I'm ready to move on to making it concurrent:

```shell
$ elixir parallel_letter_frequency_test.exs

FrequencyTest
...

Finished in 0.1 seconds (0.04s on load, 0.1s on tests)
9 tests, 0 failures
```

## Make the function concurrent

Having all the tests passing gives me the confidence to add concurrency to `frequency/2` without breaking it.

### Adding concurrency with Elixir's `Task` module

[Elixir's `Task` module](https://hexdocs.pm/elixir/Task.html) is the go-to toolbox for writing asynchronous and concurrent code in Elixir. Under the hood, `Task` handles the spawning of multiple Elixir processes (workers) to carry out asynchronous tasks and await the results.

In this case, I believe the most suitable function in the `Task` toolbox is [`Task.async_stream/5`](https://hexdocs.pm/elixir/Task.html#async_stream/5), which will start a process/worker for each item in `enumerable` and apply `function` to the item:

```elixir
Task.async_stream(enumerable, module, function, args, options \\ [])
```

The diagram below shows how I plan to use `Task.async_stream/5` to make the code concurrent:

![Making the letter frequency computation concurrent](https://www.toptechskills.com/images/articles/elixir-parallel-letter-frequency/exercism-elixir-parallel-letter-concurrency-542f1e2cf1.png)

The list of graphemes will be split into chunks and each chunk will be passed to a worker process that applies the `count_letters/1` function to get the result. I'll need a function to split the list of graphemes into a certain number of chunks and another to merge the results from all the workers:

```elixir
def frequency(texts, workers) do
  texts
  |> get_all_graphemes()
  |> split_into_chunks(workers)
  |> Task.async_stream(__MODULE__, :count_letters, [])
  |> merge_results_stream()
end

defp split_into_chunks(all_graphemes, num_chunks) do
  # TODO: split all_graphemes into a certain number of chunks
  [all_graphemes]
end

defp merge_results_stream(results_stream) do
  # TODO: merge all the results in the stream into a single map
  Enum.to_list(results_stream)
end
```

### Split the list of graphemes into a certain number of chunks

The `split_into_chunks/2` function accepts list of graphemes and should split the list into chunks that can be passed to each worker:

```elixir
split_into_chunks(["a", "b", "c", "d"], 2)
# => [["a", "b"], ["c", "d"]]
```

[`Enum.chunk_every/2`](https://hexdocs.pm/elixir/Enum.html#chunk_every/2) does pretty much exactly that, but accepts the number of items in each chunk, rather than the number of chunks. 

Getting the number of chunks is simply a matter of dividing the number of graphemes by the number of workers required. The result of the division should be rounded up and converted to an integer, so I'll use [`:erlang.ceil/1`](http://www.erlang.org/doc/man/erlang.html#ceil-1):

```elixir
defp split_into_chunks(all_graphemes, num_chunks) do
  all_graphemes_count = Enum.count(all_graphemes)
  graphemes_per_chunk = :erlang.ceil(all_graphemes_count / num_chunks)

  Enum.chunk_every(all_graphemes, graphemes_per_chunk)
end
```

### Merge the stream of results from all workers

The final task for the concurrent code is to merge the stream of results that comes back from the workers. Each item in the stream is a tuple of `{:ok, worker_result}`:

```elixir
iex> Frequency.frequency(["A, b, C", "a, B, C"], 2)
[ok: %{"a" => 1, "b" => 1, "c" => 1}, ok: %{"a" => 1, "b" => 1, "c" => 1}]
```

In the output above, there are two maps of `%{"a" => 1, "b" => 1, "c" => 1}` that should be merged into a single map where the values are summed:

```elixir
merge_results([ok: %{"a" => 1, "b" => 1, "c" => 1}, ok: %{"a" => 1, "b" => 1, "c" => 1}])
# => %{"a" => 2, "b" => 2, "c" => 2}
```

Combining [`Enum.reduce/3`](https://hexdocs.pm/elixir/Enum.html#reduce/3) and [`Map.merge/3`](https://hexdocs.pm/elixir/Map.html#merge/3) is probably the best choice. `Map.merge/3` allows me to supply a function that decides what happens if a key exists in both maps. In this case, I'd like to add the values from each map together. The example from the docs demonstrates this exact use case:

```elixir
iex> Map.merge(%{a: 1, b: 2}, %{a: 3, d: 4}, fn _key, val1, val2 ->
...>   val1 + val2
...> end)
%{a: 4, b: 2, d: 4}
```

My final code for `merge_results_stream/1` looks like this:

```elixir
defp merge_results_stream(results_stream) do
  Enum.reduce(results_stream, %{}, fn {:ok, worker_result}, acc ->
    Map.merge(acc, worker_result, fn _key, acc_val, worker_val ->
      acc_val + worker_val
    end)
  end)
end
```

### Final concurrent code

With the helper functions done, the final concurrent code is complete:

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

The tests are still passing, giving me confidence in the correctness of the concurrent code:

```shell
$ elixir parallel_letter_frequency_test.exs

FrequencyTest
...

Finished in 0.1 seconds (0.04s on load, 0.1s on tests)
9 tests, 0 failures
```

But there's still a million dollar question:

## Does concurrency actually make the code faster?

Concurrency can increasing the speed of code on a system by distributing work across all available CPU cores. I made `frequency/2` concurrent in the previous section, **but has it actually made the code faster?** I should really test this hypothesis before accepting the additional complexity that concurrency adds to my code. 

I've already split the clauses of the code to enable me to test the hypothesis:

```elixir
def frequency([], _workers), do: %{}

def frequency(texts, 1) do
  texts
  |> get_all_graphemes()
  |> count_letters()
end

def frequency(texts, workers) do
  texts
  |> get_all_graphemes()
  |> split_into_chunks(workers)
  |> Task.async_stream(__MODULE__, :count_letters, [])
  |> merge_results_stream()
end
```

The original implementation of the function is called when `workers == 1`, and the concurrent implementation when `workers > 1`. All I need to do now is benchmark the function for the same input, with varying numbers of `workers`.

### Benchmarking the function

There are a number of ways I can benchmark Elixir code:

1. Use [`benchee`](https://github.com/PragTob/benchee), a package made specifically for benchmarking Elixir code
2. Use Erlang's [`:timer.tc/1`](http://www.erlang.org/doc/man/timer.html#tc-1) to time how long an Elixir function takes to execute
3. Use the [`time` command](https://en.wikipedia.org/wiki/Time_(Unix)) found on Unix and Unix-like operating systems to time the execution of an Elixir script (`.exs`)

I think option 1 is the best overall; it will require the most work, but will give the best results. Since `benchee` is an external dependency, I first need to convert the `Frequency` module into a [`Mix`](https://hexdocs.pm/mix/Mix.html) application.

### Convert `Frequency` into a `Mix` application

I'll create a new `Mix` application called `frequency` with `mix new`:

```shell
$ mix new frequency
...

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd frequency
    mix test

Run "mix help" for more commands.
```

Install `benchee`:

```elixir
# mix.exs

defp deps do
  [
    {:benchee, "~> 0.13", only: :dev}
  ]
end
```

```shell
$ cd frequency
$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
New:
  benchee 0.13.2
  deep_merge 0.2.0
* Getting benchee (Hex package)
* Getting deep_merge (Hex package)
```

And copy the contents of the original `frequency.exs` file into `lib/frequency.ex`:

```elixir
# lib/frequency.ex

defmodule Frequency do
  ...
  def frequency([], _workers), do: %{}

  def frequency(texts, 1) do
  ...

  def frequency(texts, workers) do
  ...

  defp split_into_chunks(all_graphemes, num_chunks) do
  ...

  defp merge_results_stream(results_stream) do
  ...

  defp get_all_graphemes(texts) do
  ...

  def count_letters(graphemes) do
  ...
end
```

### Create a script that calls `benchee` to benchmark the code

All that's left to do is create an Elixir script that calls [`Benchee.run/2`](https://hexdocs.pm/benchee/Benchee.html#run/2) to benchmark our function with different numbers of workers:

```elixir
# benchmark.exs

duplicates =
  System.argv()
  |> List.first()
  |> String.to_integer()

text = "The quick brown fox jumps over the lazy dog"
texts = List.duplicate(text, duplicates)

Benchee.run(%{
  "original code" => fn -> Frequency.frequency(texts, 1) end,
  "concurrent code: 2 workers" => fn -> Frequency.frequency(texts, 2) end,
  "concurrent code: 4 workers" => fn -> Frequency.frequency(texts, 4) end,
  "concurrent code: 8 workers" => fn -> Frequency.frequency(texts, 8) end
})
```

The `texts` variable is created by multiplying `text` a certain number of times. [`List.duplicate/2`](https://hexdocs.pm/elixir/List.html#duplicate/2) is a convenient way of creating a large list of strings to pass to the `frequency/2` function:

```elixir
iex> List.duplicate("hello", 3)
["hello", "hello", "hello"]
```

The `duplicates` variable uses the first argument when calling the script from the command line, so I'm able to vary the size of `texts` by changing the value of the argument. 

For example, I could set `duplicates` to `1` by running:

```shell
$ mix run benchmark.exs 1
```

Or `1000` by running:

```shell
$ mix run benchmark.exs 1000
```

## Concurrent vs non-current benchmark results 

### Benchmark results: `duplicates == 1`

```shell
$ mix run benchmark.exs 1
Operating System: macOS"
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.8.0
Erlang 21.1.1

...

Name                                 ips        average  deviation         median         99th %
original code                    18.91 K       52.88 μs    ±26.19%          49 μs         114 μs
concurrent code: 2 workers        8.96 K      111.59 μs    ±26.41%         103 μs         230 μs
concurrent code: 4 workers        7.27 K      137.57 μs    ±24.44%         125 μs         285 μs
concurrent code: 8 workers        6.00 K      166.76 μs    ±22.26%         154 μs         329 μs

Comparison:
original code                    18.91 K
concurrent code: 2 workers        8.96 K - 2.11x slower
concurrent code: 4 workers        7.27 K - 2.60x slower
concurrent code: 8 workers        6.00 K - 3.15x slower
```

Wow! For `duplicates == 1`, the concurrent code is **slower** than the original code by a significant amount. In fact, the code gets slower as the workers increase, with 8 workers being over **3 times slower** than the original code.

I sort of expected this. The `text` is so short that with `duplicates == 1` there is likely to be much more time spent in breaking up the text, spawning separate processes and merging the results than the actual letter frequency computation.

### Benchmark results: `duplicates == 100`

```shell
$ mix run benchmark.exs 100
Operating System: macOS"
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.8.0
Erlang 21.1.1

...

Name                                 ips        average  deviation         median         99th %
concurrent code: 8 workers        190.34        5.25 ms    ±10.34%        5.08 ms        7.24 ms
concurrent code: 4 workers        182.38        5.48 ms     ±8.78%        5.34 ms        7.18 ms
concurrent code: 2 workers        176.21        5.67 ms     ±8.98%        5.52 ms        7.55 ms
original code                     159.70        6.26 ms     ±9.47%        6.07 ms        8.71 ms

Comparison:
concurrent code: 8 workers        190.34
concurrent code: 4 workers        182.38 - 1.04x slower
concurrent code: 2 workers        176.21 - 1.08x slower
original code                     159.70 - 1.19x slower
```

With `duplicates == 100` the concurrent code starts to perform better than the original code by a small margin. There is little difference between 4 and 8 workers, but both are around 20% faster than the original code.

For such a small improvement, the additional complexity added by the concurrent code is probably not worthwhile at this workload.

### Benchmark results: `duplicates == 1000`

```shell
$ mix run benchmark.exs 1000
Operating System: macOS"
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.8.0
Erlang 21.1.1

...

Name                                 ips        average  deviation         median         99th %
concurrent code: 8 workers         28.04       35.66 ms    ±17.33%       33.45 ms       56.97 ms
concurrent code: 4 workers         26.72       37.42 ms    ±15.06%       35.69 ms       58.45 ms
concurrent code: 2 workers         20.84       47.98 ms    ±11.75%       46.48 ms       73.73 ms
original code                      15.34       65.21 ms    ±12.37%       62.90 ms       88.35 ms

Comparison:
concurrent code: 8 workers         28.04
concurrent code: 4 workers         26.72 - 1.05x slower
concurrent code: 2 workers         20.84 - 1.35x slower
original code                      15.34 - 1.83x slower
```

At `duplicates == 1000` there is a significant difference between the original code and the concurrent code, with 4 and 8 workers both around 80% faster.

The difference between 4 and 8 workers is minimal, most likely because the number of physical cores on my system is 4. The value of `8` being reported by `benchee` is due to my processor having [`Hyper-threading`](https://en.wikipedia.org/wiki/Hyper-threading), which doubles the number of _logical_ cores seen by the OS.

### Benchmark results: `duplicates == 10_000`

```shell
$ mix run benchmark.exs 10000
Operating System: macOS"
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.8.0
Erlang 21.1.1

...

Name                                 ips        average  deviation         median         99th %
concurrent code: 8 workers          2.59      386.24 ms     ±3.59%      388.54 ms      404.97 ms
concurrent code: 4 workers          2.40      417.01 ms     ±5.90%      413.12 ms      464.11 ms
concurrent code: 2 workers          1.91      523.79 ms     ±3.70%      525.62 ms      564.83 ms
original code                       1.44      696.58 ms     ±4.97%      690.44 ms      750.42 ms

Comparison:
concurrent code: 8 workers          2.59
concurrent code: 4 workers          2.40 - 1.08x slower
concurrent code: 2 workers          1.91 - 1.36x slower
original code                       1.44 - 1.80x slower
```

At `duplicates == 10_000` the concurrent code is still the clear victor. `8 workers` performs the best on my system, at around 80% faster than the original non-concurrent implementation. 

On average, `8 workers` computes the result over `300ms` faster than the original code (`386ms` vs `696ms`), which is pretty significant. 

## Conclusion

In this post I've walked you through how I solved the [Parallel Letter Frequency problem](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency) on [Exercism's Elixir Track](https://exercism.io/tracks/elixir). I hope it's been useful for you to be able see my approach to solving the problem and how you might use the `Task` module to add concurrency to your applications. **A word of warning:** as the benchmarks demonstrate, depending on your specific workload, adding concurrency can actually reduce performance while also making your code more complex. When in doubt, write the [cleanest, most expressive code](https://www.oreilly.com/library/view/code-complete-second/0735619670/) you can and test whether or not changes actually improve performance.

I was able to make the `frequency/2` function run around **80% faster** on my system for certain workloads by using 4 ~ 8 workers. This improvement could be crucial for your application -- returning a result in around half the time could be the difference between acceptable and unusable. But if your application demands such high CPU performance for acceptable usability, Elixir may not be the correct technology choice.

This shouldn't be interpreted as a criticism of Elixir's `Task` module, which is an incredibly useful toolbox for writing asynchronous code with ease. For example, you could use functions in the `Task` module to make multiple HTTP requests concurrently, rather than waiting for each request to succeed/fail before making the next one. This could shave off hundreds of milliseconds and significantly improve the experience for users or your [`PageSpeed`](https://developers.google.com/speed/) results.

Did you solve this problem in a different way?

Did you find an implementation that's even faster than mine?

Hit me up in the comments and let's discuss!
