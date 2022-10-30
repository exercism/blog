Solving an exercse on Exercism is just the first. 
The real learning comes next.

This week we've launched the new "Dig Deeper" tab on exercises - designed as a way to help you go beyond the solving stage and explore its nuances and tradeoffs of an exercise, without needing to ask a mentor.

## Introduction

The solutions to our exercises vary phenominally. 
The most basic "proper" exercise in most tracks is `TwoFer`. 
A typical solution looks like this (this is Ruby, but its similar for most langauges):

```ruby
module TwoFer
  def self.two_fer(name='you')
    "One for #{name}, one for me."
  end
end
```

However, out of the most recent 500 solutions that passed the tests, over 350 of them were unique 😲 
And even when you normalise things like whitespace and variable names, over half will still be actual unique solutions.

Which makes it utterly fascinating to explore how everyone is solving things. 
But it's also entirely impractical. There are millions of solutions on Exercism and reading them all would quite literally take a lifetime.

However! Having designed the exercises, and mentored hundreds of thousands of people through them, our team have a pretty good idea of the different approaches people take.
So we've added the new Dig Deeper tab to highlight the different idiomatic (or non-idiomatic, but interesting) ways that an exercise can be solved!

## An example

Let's take an example to show this in action. 
In C# there are various ways you can reverse a string.

You can use the `Array.Reverse()` method:
```csharp
var chars = input.ToCharArray();
Array.Reverse(chars);
return new string(chars);
```

Or use a shorter, LINQ-based approach:
```csharp
return new string(input.Reverse().ToArray());
```

or use a `StringBuilder`:
```
var chars = new StringBuilder();
for (var i = input.Length - 1; i >= 0; i--)
{
    chars.Append(input[i]);
}
return chars.ToString();
```

or even go slightly less idiomatic (but more performant!) and use `Span<T>`:

```csharp
Span<char> chars = stackalloc[input.Length];
for (var i = 0; i < input.Length; i++)
{
    chars[input.Length - 1 - i] = input[i];
}
return new string(chars);
```

We call each of these an Approach, and each has it's own seperate article explaining it. 
The Dig Deeper page for this exercise brings those together, and also comes with an article on performance that explores the tradeoffs!

[👉🏾 Check it out](https://exercism.org/tracks/csharp/exercises/reverse-string/dig_deeper) (you will need to go incognito if you've not solved the exercise yet)

## But there's more!

As well as having documents on these different approaches, there are thousands of videos that our community have produced exploring exercises, recording walkthroughs or streaming sessions, and diving into the depths of what makes idiomatic solutions.
We're collating all those exercises and bringing them onto the pages.

## Get involved

Over the next few weeks, you’ll start to see the Dig Deeper tab appearing across exercises around the site.

If you'd like to contribute an Approach, an exercise article, or tell us about your vidoeos so we can add them, get in touch with [jonathan@exercism.org](mailto:jonathan@exercism.org) and he'll help you get started!
