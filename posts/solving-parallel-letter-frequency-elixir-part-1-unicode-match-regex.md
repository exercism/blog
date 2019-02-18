# 1. What Parallel Letter Frequency can teach you about Unicode matching in Elixir

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

Luckily for all the Alchemists out there, Elixir has some core features that make solving this problem relatively simple. But -- if you're like me -- you might have never used them prior to starting this problem. One such feature is Unicode matching, and in this post I'll walk you through how I used it to help me solve the Parallel Letter Frequency problem.

## Determine whether a character is a letter in Elixir

How would you use Elixir to determine whether or not `"a"` is a letter? 

I think most people would apply a regular expression like `/[a-z]/`:

```elixir
iex> String.match?("a", ~r/^[a-z]$/)
true
```

What about `"A"`? 

Adding the `i` [(caseless) modifier](https://hexdocs.pm/elixir/Regex.html#module-modifiers) would probably be the easiest way:

```elixir
iex> String.match?("A", ~r/^[a-z]$/i)
true
```

Ok, now what about `"ö"`? 

When I first approached this problem, I wasn't sure of the best way --`/[a-z]/i` is definitely not going to work:

```elixir
iex> String.match?("ö", ~r/^[a-z]$/i)
false
```

Determining whether or not `"ö"` is a letter is a core part of solving this Exercism problem, as one of the texts in the tests is in German:

```elixir
# parallel_letter_frequency_test.exs
...
# Poem by Friedrich Schiller. The corresponding music is the European Anthem.
@ode_an_die_freude """
Freude schöner Götterfunken
...
"""
```

Initially I thought I could use a regular expression to check if a character **isn't** a special character, but decided that was a dead end. A regular expression like that was going to be long, inelegant and fragile; I was not confident that I could list every special character that could possibly come up, and it seemed to be the wrong way to approach the problem anyway.

## Unicode regular expressions in Elixir

Digging deeper, I learned about the [`u` modifier in Elixir's `Regex` module](https://hexdocs.pm/elixir/Regex.html):

> unicode (`u`) - enables Unicode specific patterns like `\p` and change modifiers like `\w`, `\W`, `\s` and friends to also match on Unicode.

It turns out that the `u` modifier -- and [specifically the `\p` pattern](https://www.regular-expressions.info/unicode.html) -- was exactly what I needed. The `\p` pattern lets you match a grapheme (another name for a single Unicode character) in any of the [Unicode character categories](https://en.wikipedia.org/wiki/Unicode_character_property#General_Category). This not only includes specific categories like `Ll` ([Letter, lowercase](https://www.compart.com/en/unicode/category/Ll)) and `Sc` ([Symbol, currency](https://www.compart.com/en/unicode/category/Sc)), but also the parent categories like `L` (Letter) and `S` (Symbol).

You can match _any_ letter  of _any_ case in _any_ [human language covered by Unicode](https://www.unicode.org/faq/basic_q.html) with the pattern `\p{L}` and easily [use it in Elixir regular expressions](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/how-to-match-any-unicode-letter-with-regex-elixir/) to solve the problem: 

```elixir
iex> String.match?("a", ~r/^\p{L}$/u)
true

iex> String.match?("A", ~r/^\p{L}$/u)
true

iex> String.match?("ö", ~r/^\p{L}$/u)
true

iex> String.match?("$", ~r/^\p{L}$/u)
false
```

I applied this specific regular expression in the `count_letters/1` function of my solution. This function accepts a list of graphemes, e.g. `["a", "A", "ö", "$"]`, and returns a map that counts only the letters while ignoring the case -- `%{"a" => 2, "ö" => 1}`:

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

## Conclusion

It turns out that matching non-English letters becomes pretty simple when you know about Unicode matching, and luckily for us it's a core feature in Elixir. Prior to solving this problem I barely knew about this feature, but I would now consider it an indispensable part of my Elixir toolbox. If you also just learned about Unicode matches, I hope this post has given you some ideas about how you might apply it in your application.

✅ [View my published solution on Exercism](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952).
