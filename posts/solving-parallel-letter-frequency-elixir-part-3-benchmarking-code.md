Exercises on Exercism are small, synthetic, and often seemingly trivial. It’s easy to imagine that experienced practitioners would have nothing to learn from them. However, solving these synthetic problems can push you to learn and apply parts of your language that you may not have explored. This new learning can lead you to solve real world problems more efficiently or in a more expressive way.

[Parallel Letter Frequency](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency) is a medium difficulty exercise on [Exercism's Elixir Track](https://exercism.io/tracks/elixir) that unpacks a surprising number of interesting lessons. To solve this problem successfully, your solution should execute in parallel in a number of worker processes. Concurrency and parallelism are often seen as a sure way to make your code faster, but in some cases can have the opposite effect. It's a bad idea to assume that making any code change will improve performance without testing that assumption with benchmarks. There are a number of ways to benchmark Elixir code, and learning how to do it will help you test performance assumptions in your own applications.

This exercise requires you to implement a `Frequency.frequency/2` function that determines the letter frequency in a list of strings. The calculation should be carried out in a number of worker processes, set by the `workers` argument:

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

Does parallelism improve performance for this calculation, or have we inadvertently made it slower than a regular sequential implementation? In this post I'll walk you through how you can benchmark your solution to determine whether or not parallelism actually increased performance.

The example code in this post comes from [my solution to this exercise](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952), but you can easily apply the same process to benchmark your own solution.

## Separating sequential & parallel implementations

I used [`Task.async_stream/3`](https://hexdocs.pm/elixir/Task.html#async_stream/3) to parallelize the letter frequency calculation, which distributes the work to a number of worker processes. I also implemented some helper functions to split up the list of letters and combine the results from all the worker processes. It doesn't make sense to add all this overhead when `workers == 1`, so we should split our `frequency/2` function clauses:

* For `workers == 1`, do the letter frequency calculation with pure sequential code, without spinning up any workers at all. ("sequential implementation")
* For `workers > 1` do the letter frequency calculation in the specified number of workers. ("parallel implementation")

Here's the way I split the sequential and parallel implementations of `frequency/2` from [my solution](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952):

```elixir
def frequency([], _workers), do: %{}

# sequential implementation
def frequency(texts, 1) do
  texts
  |> get_all_graphemes()
  |> count_letters()
end

# parallel implementation
def frequency(texts, workers) do
  texts
  |> get_all_graphemes()
  |> split_into_chunks(workers)
  |> Task.async_stream(&count_letters/1)
  |> merge_results_stream()
end
```

If you've done something similar with your own solution, you're ready to compare your implementations by benchmarking them.

## Benchmarking Elixir code

There are a number of ways to benchmark Elixir code:

1. Use [`benchee`](https://github.com/PragTob/benchee), a package made specifically for [benchmarking Elixir code](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/benchmark-elixir-code-benchee/)
2. Use Erlang's [`:timer.tc/1`](http://www.erlang.org/doc/man/timer.html#tc-1) to time how long an Elixir function takes to execute
3. Use the [`time` command](https://en.wikipedia.org/wiki/Time_(Unix)) found on Unix and Unix-like operating systems to time the execution of an Elixir script (`.exs`)

I highly suggest using `benchee` for benchmarking Elixir code, it takes a little more work than the other options, but gives you much better results. Since `benchee` is an external dependency, you'll need to convert your `Frequency` module into a [`Mix`](https://hexdocs.pm/mix/Mix.html) application before using it.

## Convert your `Frequency` module into a `Mix` application

You can create a new `Mix` application inside your Exercism solution directory by running `mix new frequency`:

```shell
$ mix new frequency
...

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd frequency
    mix test

Run "mix help" for more commands.
```

Then simply install `benchee` by adding it to `mix.exs` and running `mix deps.get`:

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

Finally, copy the contents of your Exercism solution's `frequency.exs` into `frequency/lib/frequency.ex`:

```elixir
# lib/frequency.ex

defmodule Frequency do
  ...
  def frequency([], _workers), do: %{}

  def frequency(texts, 1) do
  ...
  def frequency(texts, workers) do
  ...
end
```

## Create a script that calls `benchee` to benchmark the code

You can use `benchee` in [`IEx`](https://hexdocs.pm/iex/IEx.html), but I recommend making an [Elixir script (`.exs`)](https://elixir-lang.org/getting-started/introduction.html#running-scripts) to make it easier to re-run benchmarks multiple times. I would suggest writing a script called `benchmark.exs` that calls [`Benchee.run/2`](https://hexdocs.pm/benchee/Benchee.html#run/2). Here's some code you can use for benchmarking `Frequency.frequency/2`:

```elixir
# benchmark.exs

duplicates =
  System.argv()
  |> List.first()
  |> String.to_integer()

text = "The quick brown fox jumps over the lazy dog"
texts = List.duplicate(text, duplicates)

Benchee.run(%{
  "sequential" => fn -> Frequency.frequency(texts, 1) end,
  "parallel: 2 workers" => fn -> Frequency.frequency(texts, 2) end,
  "parallel: 4 workers" => fn -> Frequency.frequency(texts, 4) end,
  "parallel: 8 workers" => fn -> Frequency.frequency(texts, 8) end
})
```

The `texts` variable is created by multiplying `text` a certain number of times. [`List.duplicate/2`](https://hexdocs.pm/elixir/List.html#duplicate/2) is a convenient way of creating a large list of strings to pass to the `frequency/2` function:

```elixir
iex> List.duplicate("hello", 3)
["hello", "hello", "hello"]
```

The `duplicates` variable is set from the first command line argument to the script by using [`System.argv/0`](https://hexdocs.pm/elixir/System.html#argv/0). You can vary the size of `texts` by changing the value of the argument.  For example, you could set `duplicates` to `1` by running:

```shell
$ mix run benchmark.exs 1
```

Or `1000` by running:

```shell
$ mix run benchmark.exs 1000
```

## My sequential vs parallel benchmark results

The next few sections go through the results of benchmarking my solution code with the `benchmark.exs` above. If you're following along, you can test your implementation with the same script and compare your results with mine.

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

Name                          ips        average  deviation         median         99th %
sequential                18.91 K       52.88 μs    ±26.19%          49 μs         114 μs
parallel: 2 workers        8.96 K      111.59 μs    ±26.41%         103 μs         230 μs
parallel: 4 workers        7.27 K      137.57 μs    ±24.44%         125 μs         285 μs
parallel: 8 workers        6.00 K      166.76 μs    ±22.26%         154 μs         329 μs

Comparison:
sequential                18.91 K
parallel: 2 workers        8.96 K - 2.11x slower
parallel: 4 workers        7.27 K - 2.60x slower
parallel: 8 workers        6.00 K - 3.15x slower
```

For `duplicates == 1`, the parallel implementation is **slower** than the sequential implementation by a significant amount. In fact, the code gets slower as the workers increase, with 8 workers being over **3 times slower** than the sequential implementation.

This makes sense: the `text` is so short that with `duplicates == 1` there is likely to be much more time spent in breaking up the text, spawning separate processes and merging the results than the actual letter frequency computation.

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

Name                          ips        average  deviation         median         99th %
parallel: 8 workers        190.34        5.25 ms    ±10.34%        5.08 ms        7.24 ms
parallel: 4 workers        182.38        5.48 ms     ±8.78%        5.34 ms        7.18 ms
parallel: 2 workers        176.21        5.67 ms     ±8.98%        5.52 ms        7.55 ms
sequential                 159.70        6.26 ms     ±9.47%        6.07 ms        8.71 ms

Comparison:
parallel: 8 workers        190.34
parallel: 4 workers        182.38 - 1.04x slower
parallel: 2 workers        176.21 - 1.08x slower
sequential                 159.70 - 1.19x slower
```

With `duplicates == 100` the parallel implementation started to perform better than the sequential implementation by a small margin. There was little difference between 4 and 8 workers, but both were around 20% faster than the sequential implementation.

For such a small improvement, the additional complexity added by the parallel implementation is probably not worthwhile at this workload.

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

Name                          ips        average  deviation         median         99th %
parallel: 8 workers         28.04       35.66 ms    ±17.33%       33.45 ms       56.97 ms
parallel: 4 workers         26.72       37.42 ms    ±15.06%       35.69 ms       58.45 ms
parallel: 2 workers         20.84       47.98 ms    ±11.75%       46.48 ms       73.73 ms
sequential                  15.34       65.21 ms    ±12.37%       62.90 ms       88.35 ms

Comparison:
parallel: 8 workers         28.04
parallel: 4 workers         26.72 - 1.05x slower
parallel: 2 workers         20.84 - 1.35x slower
sequential                  15.34 - 1.83x slower
```

At `duplicates == 1000` there was a significant difference between the sequential and parallel implementations, with 4 and 8 workers both around 80% faster than the sequential implementation.

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

Name                          ips        average  deviation         median         99th %
parallel: 8 workers          2.59      386.24 ms     ±3.59%      388.54 ms      404.97 ms
parallel: 4 workers          2.40      417.01 ms     ±5.90%      413.12 ms      464.11 ms
parallel: 2 workers          1.91      523.79 ms     ±3.70%      525.62 ms      564.83 ms
sequential                   1.44      696.58 ms     ±4.97%      690.44 ms      750.42 ms

Comparison:
parallel: 8 workers          2.59
parallel: 4 workers          2.40 - 1.08x slower
parallel: 2 workers          1.91 - 1.36x slower
sequential                   1.44 - 1.80x slower
```

At `duplicates == 10_000` the parallel implementation was still the clear victor. Parallel with 8 workers performed the best on my system, at around 80% faster than the sequential implementation. 

On average, parallel with 8 workers computed the result over `300ms` faster than the sequential implementation (`386ms` vs `696ms`), which is pretty significant.

## Conclusion

This Exercism exercise really highlights that although concurrency and parallelism are often seen as a sure way to make your code faster, in some cases they can have the opposite effect. 

The parallel implementation of my solution ran around **80% faster** on my system for certain workloads, but in some cases was over **3x slower than the sequential implementation**. An 80% improvement could be crucial for your application -- returning a result in around half the time could be the difference between acceptable and unusable. However, depending on your specific situation, adding parallelism has the potential to actually _reduce_ performance while also making your code more complex.

Benchmarking your code with `benchee` is simple enough that you don't need to make assumptions about the effect a code change has on performance. When in doubt, write the [cleanest, most expressive code you can](https://www.oreilly.com/library/view/code-complete-second/0735619670/) and use `benchee` to test whether changes to your code _actually_ improve performance or not.
