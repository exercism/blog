# Finding Leap Years with cal

_This post originally appeared on [Stephen's website](https://www.strangeleaflet.com/blog/finding-leap-years-with-the-cal-command) and is republished here (slightly rewritten) with permission_

## Introduction to cal

Did you know that there's a calendar in the macOS and Linux command line?

```bash
$ cal

     July 2021
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
```

A quick check of `tldr` shows how useful this utility can be

```bash
$ tldr cal

cal

Prints calendar information.

- Display a calendar for the current month:
    cal

- Display previous, current and next month:
    cal -3

- Display a calendar for a specific month (1-12 or name):
    cal -m month

- Display a calendar for the current year:
    cal -y

- Display a calendar for a specific year (4 digits):
    cal year

- Display a calendar for a specific month and year:
    cal month year

- Display date of Easter (Western Christian churches) in a given year:
    ncal -e year
```

But there's one thing it doesn't have. Leap years!

Cal _knows_ about leap years of course, it wouldn't be much of a calendar otherwise. But it doesn't have a way to list them.

## Recognizing leap years, hackishly

Let's build it ourselves! Sure we could use a real programming language with a calendar library but building things by assembling command line components is fun and it's not like we're going to put this calculation into production.

First off, let's agree that February is the indicator for a leap year.

```bash
$ cal 02 2021

   February 2021
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28

$ cal 02 2020

   February 2020
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
```

Could we search for "29" and have it recognize leap years? Maybe!

```bash
$ cal 02 2020 | grep -q 29 && echo "LEAP" || echo "normal"

LEAP

$ cal 02 2021 | grep -q 29 && echo "LEAP" || echo "normal"

normal
```

So far so good? But I bet you see the problem.

```bash
$ for year in {2020..2030}; do
  printf "$year ";
  cal 02 "$year" | grep -q 29 && echo "LEAP" || echo "year";
done

2020 LEAP
2021 year
2022 year
2023 year
2024 LEAP
2025 year
2026 year
2027 year
2028 LEAP
2029 LEAP
2030 year
```

2029 is NOT a leap year. It's only matching because of the 29 in 2029.

```bash
$ cal 02 2029

   February 2029
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28
```

We could remove that troublesome result by removing the entire line with "February" from consideration.

```bash
$ cal 02 2029 | grep -v Feb

Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28
```

Now I hold that if we find a "29" in the result then it REALLY is a leap year.

```bash
$ for year in {2020..2030}; do
  printf "$year ";
  cal 02 "$year" | grep -v Feb | grep -q 29 && echo "LEAP" || echo "year";
done

2020 LEAP
2021 year
2022 year
2023 year
2024 LEAP
2025 year
2026 year
2027 year
2028 LEAP
2029 year
```

Does that match up with actual leap years?

[Wolfram Research's Leap Year](https://scienceworld.wolfram.com/astronomy/LeapYear.html) page has this list as the leap years in the first half of the 21st century.

```bash
2000
2004
2008
2012
2016
2020
2024
2028
2032
2036
2040
2044
2048
```

Let's see how we do

```bash
$ for year in {2000..2051}; do cal 02 "$year" | grep -v Feb | grep -q 29 && echo $year; done
2000
2004
2008
2012
2016
2020
2024
2028
2032
2036
2040
2044
2048
```

Done!

But this grepping for 29 is too easy. Let's get weirder!

## Recognizing leap years, even more hackishly

The difference between a leap year and a normal year is that extra day of the 29th. Could we check the number of characters in the output from `cal` to recognize leap years?

Yes we can. But there's a gotcha to get through first. Let me show you what I mean.

We know 2020 is a leap year and 2021 is not a leap year. Let's check the difference between the number of characters output for February of each of those years. We'll do that with the handy `wc` utility, specifically `wc -c` to count the byte characters.

```bash
$ printf "hello" | wc -c

5
```

5 characters in "hello" (using `printf` instead of `echo` because otherwise we'd have a newline character as well). Great!

```bash
$ cal 02 2020 | wc -c

184
```

```bash
$ cal 02 2021 | wc -c

184
```

There's the stumbling block. Each month has different output (2020 has that 29th day) but they both have the same number of characters because cal adds spaces to ensure consistent formatting. Spaces are countable characters just as much as numbers.

What can we do?

We can remove all the spaces! That would leave only the characters we want to count.

A great utility for removing characters is the `tr` command. The `tr` command translates string data. For example, it can change all `a` characters into `A` characters.

```bash
$ echo "aardvark" | tr a A

AArdvArk
```

It can also delete all specified characters which is exactly what we want.

In our case we want to delete all whitespace characters, no matter what they are (spaces, tabs, newlines, etc). There's a useful grouping called a character class which allows us to do exactly that. The characater class `[:space:]` will target all of those different kinds of whitespace characters.

```bash
$ cal 02 2020 | tr -d '[:space:]'

February2020SuMoTuWeThFrSa1234567891011121314151617181920212223242526272829
```

```bash
$ cal 02 2021 | tr -d '[:space:]'

February2021SuMoTuWeThFrSa12345678910111213141516171819202122232425262728
```

Great! Can we count the number of characters to find leap years now? We sure can!

```bash
$ cal 02 2020 | tr -d '[:space:]' | wc -c

75
```

```bash
$ cal 02 2021 | tr -d '[:space:]' | wc -c

73
```

Now let's output some leap years!

```bash
$ for year in {2000..2051}; do
  cal 02 "$year" |
    tr -d '[:space:]' |
    wc -c |
    grep -q 75 && echo "$year";
done

2000
2004
2008
2012
2016
2020
2024
2028
2032
2036
2040
2044
2048
```

Hacks on hacks and it works!

Which do you think is faster? Yeah I have no idea either. The "remove February" path is maybe faster? But I'd be surprised if there's a huge difference.

Let's not be surprised. Let's find out!

There's a great utility called `hyperfine` that allows evaluating the performance of multiple command line calls

## Which is faster? Hyperfine will tell us

Here's the flags I'm giving to hyperfine along with the two commands.

```bash
--style basic
    Plain output styling
--export-markdown hyperfine.md
    Export results as markdown
--warmup 5
     Do five runs before benchmarking
--ignore-failure
     Ignore non-zero exits
```

We're only concerned with benchmarking the calculation of a year and not the time required to generate the loop of years. So I'll only benchmark checking the leap year for a specific year with each approach.

```bash
$ hyperfine --style basic --export-markdown hyperfine.md --warmup 5 --ignore-failure "cal 02 2050 | grep -v Feb | grep -q 29" "cal 02 2050 | tr -d '[:space:]' | wc -c | grep -q 75"

Benchmark #1: cal 02 2050 | grep -v Feb | grep -q 29
  Time (mean ± σ):       1.8 ms ±   0.3 ms    [User: 0.7 ms, System: 1.9 ms]
  Range (min … max):     1.0 ms …   3.6 ms    493 runs

  Warning: Command took less than 5 ms to complete. Results might be inaccurate.
  Warning: Ignoring non-zero exit code.

Benchmark #2: cal 02 2050 | tr -d '[:space:]' | wc -c | grep -q 75
  Time (mean ± σ):       1.9 ms ±   0.4 ms    [User: 0.9 ms, System: 2.7 ms]
  Range (min … max):     0.7 ms …   5.9 ms    811 runs

  Warning: Command took less than 5 ms to complete. Results might be inaccurate.
  Warning: Ignoring non-zero exit code.

Summary
  'cal 02 2050 | grep -v Feb | grep -q 29' ran
    1.07 ± 0.28 times faster than 'cal 02 2050 | tr -d '[:space:]' | wc -c | grep -q 75'
```

| Command                                                   | Mean [ms] | Min [ms] | Max [ms] |    Relative |
| :-------------------------------------------------------- | --------: | -------: | -------: | ----------: |
| `cal 02 2050 \| grep -v Feb \| grep -q 29`                | 1.8 ± 0.3 |      1.0 |      3.6 |        1.00 |
| `cal 02 2050 \| tr -d '[:space:]' \| wc -c \| grep -q 75` | 1.9 ± 0.4 |      0.7 |      5.9 | 1.07 ± 0.28 |

As expected, practically no difference between them as far as wall clock time, BUT the "remove February" path may be _slightly_ faster.

That brings this command line tool assembly journey to an end.

## Wrap up

- You can build new command line features by assembling existing tools into a data pipeline
- A bit of creativity can get surprisingly complex results from simple pieces
- Hyperfine is a useful tool for benchmarking command line commands

## Next steps

- Explore using the `cal` command.
- Try building a pipeline that counts all the non-space characters for an entire year: `cal 2020`
- Try running that entire year counting pipeline for each of the years from 1750 to 1759: notice anything odd?
