Exercises on Exercism are small, synthetic, and often seemingly trivial. It’s easy to imagine that experienced practitioners would have nothing to learn from them. However, solving these synthetic problems can push you to learn and apply parts of your language that you may not have explored. This new learning can lead you to solve real world problems more efficiently or in a more expressive way.

[Parallel Letter Frequency](https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency) is a medium difficulty exercise on [Exercism's Elixir Track](https://exercism.io/tracks/elixir) that unpacks a surprising number of interesting lessons. A central challenge in solving the exercise is handling letters from multiple languages, as one of the test cases is in German and contains characters outside the English alphabet. If you spend most of your time developing applications for English speakers, this may be the first time you've had to deal with a requirement like this. The learning from this exercise has clear benefits for anyone writing a multilingual/non-English application, but could also help in many other areas, such as more robust username and password validations.

To solve the exercise successfully, you need to implement a `Frequency.frequency/2` function that determines letter frequency in a list of strings that could be in any language:

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

Let's start with the fundamental problem this function needs to solve and work our way up to a full implementation.

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

Maybe you could use regular expression to check if a character **isn't** a special character, but it's likely to be long, inelegant and fragile. How confident can you be that you've covered every possible special character that might be passed as input to your function? I believe there's a better approach.

## Unicode regular expressions in Elixir

A better approach to this problem is using the [`u` modifier in Elixir's `Regex` module](https://hexdocs.pm/elixir/Regex.html):

> unicode (`u`) - enables Unicode specific patterns like `\p` and change modifiers like `\w`, `\W`, `\s` and friends to also match on Unicode.

It turns out that the `u` modifier -- and [specifically the `\p` pattern](https://www.regular-expressions.info/unicode.html) -- is a really elegant solution. The `\p` pattern lets you match a grapheme (another name for a single Unicode character) in any of the [Unicode character categories](https://en.wikipedia.org/wiki/Unicode_character_property#General_Category). This not only includes specific categories like `Ll` ([Letter, lowercase](https://www.compart.com/en/unicode/category/Ll)) and `Sc` ([Symbol, currency](https://www.compart.com/en/unicode/category/Sc)), but also the parent categories like `L` (Letter) and `S` (Symbol).

You can match _any_ letter  of _any_ case in _any_ [human language covered by Unicode](https://www.unicode.org/faq/basic_q.html) with the pattern `\p{L}`. This allows for some [pretty powerful matching](https://www.toptechskills.com/elixir-phoenix-tutorials-courses/how-to-match-any-unicode-letter-with-regex-elixir/#more-cool-stuff-you-can-match-with-unicode).

Basic Latin characters from English work as usual:

```elixir
iex> String.match?("a", ~r/^\p{L}$/u)
true
iex> String.match?("A", ~r/^\p{L}$/u)
true
```

Latin character variants with [umlauts](https://en.wikipedia.org/wiki/Umlaut_(linguistics)) and [acute accents](https://en.wikipedia.org/wiki/Acute_accent) are no problem either:

```elixir
iex> String.match?("ö", ~r/^\p{L}$/u)
true
iex> String.match?("Á", ~r/^\p{L}$/u)
true
```

Let's make sure it's not just returning a match for any character. How about some characters that look like letters but aren't:

```elixir
iex> String.match?("$", ~r/^\p{L}$/u)
false
iex> String.match?("@", ~r/^\p{L}$/u)
false
```

Very nice, but remember how I said _any_ language? No sweat:

```elixir
# Chinese character for "you"
iex> String.match?("你", ~r/^\p{L}$/u)
true

# Cyrillic capital letter "zhe"
iex> String.match?("Ж", ~r/^\p{L}$/u)
true
```

## Applying Unicode matching to the problem at hand

Now that we have a tool that can help us determine whether or not a grapheme is a letter, we can apply it to solve the problem. An initial implementation of the `Frequency.frequency/2` function might look like this:

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
```

All `count_letters/1` would need to do is apply the `String.match?(grapheme, ~r/^\p{L}$/u)` pattern we identified above to increment the count of each letter in the list of `graphemes`. Here's an example implementation taken from [my solution to this Exercism problem]((https://exercism.io/tracks/elixir/exercises/parallel-letter-frequency/solutions/cc80004beded4749bce81b5dc0820952).):

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

This function accepts a list of graphemes, e.g. `["a", "A", "ö", "$"]`, and returns a map that counts only the letters while ignoring the case -- `%{"a" => 2, "ö" => 1}`. Considering that this function can handle input from any language, I would say it's a pretty powerful 9 lines of code. 

## Conclusion

It turns out that matching non-English letters becomes pretty simple when you know about Unicode matching, and luckily for us it's a core feature in Elixir's `Regex` module. Prior to solving this Exercism problem I barely knew about this feature, but I would now consider it an indispensable part of my Elixir toolbox.

You could use this new tool in a number of ways, and a few that spring to my mind are more robust validation of passwords and usernames, or even for determining whether an input string is a valid currency string without needing to manually list [all possible currency symbols](https://www.compart.com/en/unicode/category/Sc):

```elixir
iex> currency_string_regex = ~r/\p{Sc}\d+\.\d{2}/u
~r/\p{Sc}\d+\.\d{2}/u

iex> ["$1.00", "£1.00", "¥1.00", "€1.00", "&1.00"] \
...> |> Enum.filter(&String.match?(&1, currency_string_regex))
["$1.00", "£1.00", "¥1.00", "€1.00"]
```
