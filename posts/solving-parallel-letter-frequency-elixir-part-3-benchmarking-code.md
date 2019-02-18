# 3. What Parallel Letter Frequency can teach you about benchmarking in Elixir

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

A major part of solving this problem was adding concurrency, but what's the point of adding concurrency if you can get the same result with sequential code? The primary reason for writing concurrent code is to make it faster, and although concurrency might be seen as a "free" way to make your code faster, in some cases it can have the opposite effect. In this post I'll walk you through how to benchmark Elixir code to determine whether or not adding concurrency actually increases performance.

The concurrent code in my solution ran around **80% faster** on my system for certain workloads, but in some cases was over **3x slower than the sequential code**. As the benchmarks later in the post demonstrate, depending on the situation, adding concurrency can actually **reduce performance while also increasing the complexity of your code**.

## Does concurrency actually make the code faster?

Theoretically, concurrency can speed up code on a system by distributing work across all available CPU cores, but it's a really good idea test this assumption before accepting the additional complexity and potential fragility that concurrency adds to your code.

I split the clauses of my solution's `frequency/2` function based on the number of workers to allow me to test the concurrent and sequential implementations separately:

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

The sequential implementation of the function is called when `workers == 1`, and the concurrent implementation when `workers > 1`. This allows me to benchmark both the sequential and concurrent versions of the function for the same input by simply varying the `workers` argument.

### Benchmarking the function

There are a number of ways to benchmark Elixir code:

1. Use [`benchee`](https://github.com/PragTob/benchee), a package made specifically for [benchmarking Elixir code](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/benchmark-elixir-code-benchee/)
2. Use Erlang's [`:timer.tc/1`](http://www.erlang.org/doc/man/timer.html#tc-1) to time how long an Elixir function takes to execute
3. Use the [`time` command](https://en.wikipedia.org/wiki/Time_(Unix)) found on Unix and Unix-like operating systems to time the execution of an Elixir script (`.exs`)

I felt that option 1 was the best overall; it required the most work, but gave the best results. 

Since `benchee` is an external dependency, I first needed to convert the `Frequency` module into a [`Mix`](https://hexdocs.pm/mix/Mix.html) application.

### Convert `Frequency` into a `Mix` application

I first created a new `Mix` application called `frequency` with `mix new`:

```shell
$ mix new frequency
...

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd frequency
    mix test

Run "mix help" for more commands.
```

I then installed `benchee` by adding it to the `deps` in `mix.exs` and running `mix deps.get`:

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

Finally, I copied the contents of the original `frequency.exs` into `lib/frequency.ex`:

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

To actually benchmark the code, I created an Elixir script that calls [`Benchee.run/2`](https://hexdocs.pm/benchee/Benchee.html#run/2) to benchmark the function with different numbers of `workers`:

```elixir
# benchmark.exs

duplicates =
  System.argv()
  |> List.first()
  |> String.to_integer()

text = "The quick brown fox jumps over the lazy dog"
texts = List.duplicate(text, duplicates)

Benchee.run(%{
  "sequential code" => fn -> Frequency.frequency(texts, 1) end,
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

The `duplicates` variable is set from the first command line argument from [`System.argv/0`](https://hexdocs.pm/elixir/System.html#argv/0), so I was able to vary the size of `texts` by changing its value. 

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
sequential code                  18.91 K       52.88 μs    ±26.19%          49 μs         114 μs
concurrent code: 2 workers        8.96 K      111.59 μs    ±26.41%         103 μs         230 μs
concurrent code: 4 workers        7.27 K      137.57 μs    ±24.44%         125 μs         285 μs
concurrent code: 8 workers        6.00 K      166.76 μs    ±22.26%         154 μs         329 μs

Comparison:
sequential code                  18.91 K
concurrent code: 2 workers        8.96 K - 2.11x slower
concurrent code: 4 workers        7.27 K - 2.60x slower
concurrent code: 8 workers        6.00 K - 3.15x slower
```

For `duplicates == 1`, the concurrent code is **slower** than the sequential code by a significant amount. In fact, the code gets slower as the workers increase, with 8 workers being over **3 times slower** than the sequential code.

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
sequential code                   159.70        6.26 ms     ±9.47%        6.07 ms        8.71 ms

Comparison:
concurrent code: 8 workers        190.34
concurrent code: 4 workers        182.38 - 1.04x slower
concurrent code: 2 workers        176.21 - 1.08x slower
sequential code                   159.70 - 1.19x slower
```

With `duplicates == 100` the concurrent code started to perform better than the sequential code by a small margin. There was little difference between 4 and 8 workers, but both were around 20% faster than the sequential code.

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
sequential code                    15.34       65.21 ms    ±12.37%       62.90 ms       88.35 ms

Comparison:
concurrent code: 8 workers         28.04
concurrent code: 4 workers         26.72 - 1.05x slower
concurrent code: 2 workers         20.84 - 1.35x slower
sequential code                    15.34 - 1.83x slower
```

At `duplicates == 1000` there was a significant difference between the sequential code and the concurrent code, with 4 and 8 workers both around 80% faster.

The difference between 4 and 8 workers was minimal, most likely because the number of physical cores on my system is 4. The value of `8` reported by `benchee` is due to my processor having [`Hyper-threading`](https://en.wikipedia.org/wiki/Hyper-threading), which doubles the number of _logical_ cores seen by the OS.

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
sequential code                     1.44      696.58 ms     ±4.97%      690.44 ms      750.42 ms

Comparison:
concurrent code: 8 workers          2.59
concurrent code: 4 workers          2.40 - 1.08x slower
concurrent code: 2 workers          1.91 - 1.36x slower
sequential code                     1.44 - 1.80x slower
```

At `duplicates == 10_000` the concurrent code was still the clear victor. `8 workers` performed the best on my system, at around 80% faster than the original non-concurrent implementation. 

On average, `8 workers` computed the result over `300ms` faster than the sequential code (`386ms` vs `696ms`), which is pretty significant. 

## Conclusion

The `frequency/2` function ran around **80% faster** on my system for certain workloads by using 4 to 8 workers. This improvement could be crucial for your application -- returning a result in around half the time could be the difference between acceptable and unusable.

However, as the benchmarks demonstrate, depending on your specific workload, adding concurrency can actually _reduce_ performance while also making your code more complex. When in doubt, write the [cleanest, most expressive code you can](https://www.oreilly.com/library/view/code-complete-second/0735619670/) and use a tool like `benchee` to test whether changes to your code _actually_ improve performance or not.

✅ [View my published solution on Exercism](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952).
