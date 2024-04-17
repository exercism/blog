# Some slightly silly Scrabble scoring strategies

_This post has been adapted (by the original author) from [soxfox.me](https://soxfox.me/blog/48in24-week13/)._

## Introduction

Since the introduction of the #48in24 challenge, I've challenged myself to get a gold medal each week by completing each exercise in the three featured languages. On top of that, I've been writing about each one on my blog, sometimes with some interesting extensions -- writing a Lisp macro to solve any variation of FizzBuzz, for instance.

In this post, I'm looking at the [Scrabble Score](https://exercism.org/exercises/scrabble-score) exercise. For anyone who isn't familiar with this one, the goal is to calculate the score of a word in a game of Scrabble (no bonuses, just the total of the letter values).

Let's get into it!

## Languages

### Python

[Python](https://www.python.org/) is a very popular language, and it's pretty easy to learn too. Despite the simplicity, it contains some very powerful features as you learn a bit more about it. One such feature which I'll use here is comprehensions, which provide the same functionality as `map` and `filter` functions from other languages, but with a built-in syntax.

The particular form of comprehension I use here is called a generator comprehension, which is lazy. That means it doesn't compute its elements until they are required. Using a generator comprehension and `sum`, I can solve this exercise in *just one line*:

```python
def score(word): return sum(SCORES[letter] for letter in word.upper())
```

There you go! It's written almost in plain English -- return the sum of the score of each letter in the uppercased word. ...what's `SCORES`? Don't worry about that. It doesn't matter.

```python
SCORES = {
    'A': 1,
    'B': 3,
    'C': 3,
    'D': 2,
    # ...
    'W': 4,
    'X': 8,
    'Y': 4,
    'Z': 10,
}
```

...fine, I guess 97% of the solution is just this dictionary that defines the score of every letter. Obviously it had to exist in *some* form, so how about you just ignore it and marvel at the beauty of the one-liner again!

```python
def score(word): return sum(SCORES[letter] for letter in word.upper())
```

Beautiful.

### Scheme

Time for a Lisp! It's been a while since the last featured Lisp in #48in24, but [Scheme](https://www.scheme.org/) is here to fix that. Created at MIT, Scheme provides some excellent features that go beyond most Lisp dialects, such as hygienic macros and a very powerful numeric tower that supports arbitrary precision rationals.

Scheme is typically written in functional style, so my solution here will work similarly to the Python one, but that doesn't mean there's nothing new to explore. First, I changed how the score lookup works, which makes it easier to convert from the table provided in the exercise instructions. It now lives in a function, and uses Scheme's `case` expression:

```scheme
(define (score-letter letter)
  (case (char-downcase letter)
        ((#\a #\e #\i #\o #\u #\l #\n #\r #\s #\t) 1)
        ((#\d #\g)                                 2)
        ((#\b #\c #\m #\p)                         3)
        ((#\f #\h #\v #\w #\y)                     4)
        ((#\k)                                     5)
        ((#\j #\x)                                 8)
        ((#\q #\z)                                 10)))
```

Neater, and easier to compare with the source table than the Python version. The `score` function has the same logic as the Python comprehension, but without the cool syntax:

```scheme
(define (score word)
  (apply + (map score-letter (string->list word))))
```

There's a manual conversion from string to list, because strings can't be used with `map`, and there's an interesting trick for summing the numbers. At first, I used `reduce` to do this, but I realised that the `+` function in Scheme can already take as many arguments as you like. Using `apply` is like calling the first argument (`+`) with the second argument (result of the `map`), which should be a list, as its arguments. So if the `map` evaluates to `(4 1 1 1 1)`, this becomes `(+ 4 1 1 1 1)`, finding the sum of those 5 numbers.

### C

The final featured language of the week is [C](https://en.wikipedia.org/wiki/C_(programming_language)), a low level programming language that's been around for over 50 years, and shows no signs of disappearing any time soon.

C doesn't provide the same sort of useful functional tools that I used in Python and Scheme, so this solution will need to have some explicit looping. It also doesn't provide a dictionary like Python, and while it does have a `switch`-`case` structure that could be used like Scheme's `case`, it's a bit verbose. After the not-actually-one-liner in Python, I wanted to see how compact I could get the score structure.

Initially, I just shoved all the scores into an array. Then, I can just compute `letter - 'a'` to get an index into that array and get the score. But that's not as compact as it could go, and not nearly crazy enough.

The maximum score of a letter is 10, which fits in 4 bits, so packing all the scores together results in a 104-bit string... and GCC supports a 128-bit integer type. I realised that I can treat a large number like an array by just bit-shifting and masking the result.

So, with that crazy idea in mind, let's get started:

```c
__extension__ typedef unsigned __int128 uint128;
uint128 letter_scores = 13034349334577425613786974331697;
```

To use GCC's `__int128` type on Exercism, which compiles with `-Wpedantic` enabled, you need to use the `__extension__` keyword. I put this in a `typedef` for convenience, so that I can just use `uint128`. Just to make sure everything's alright with this crazy integer, I'll build it:

```text
./scrabble_score.c:2:25: error: integer constant is too large for its type [-Werror]
    2 | uint128 letter_scores = 13034349334577425613786974331697;
```

Huh. Huh? As it turns out, you can't just use a 128-bit literal in GCC, [at least not on x86_64](https://gcc.gnu.org/onlinedocs/gcc/extensions-to-the-c-language-family/128-bit-integers.html). At first I thought I'd have to give up on the idea, but it turns out this isn't a limitation, this is just a chance to get *even crazier*.

```c
uint64_t letter_scores_arr[] = {3536193777322500913, 706593493274};
```

Wait, that's just a boring array, what happened to the big number? This is actually still the same number, arranged in a specific way. The first item in the array is the last 64 bits of the original number, and the second item is the first 64 bits. Because the tests run on a little endian architecture, this has exactly the same layout in memory as the 128-bit int would have, so if I can just find a way to treat this array as a `uint128`, it should work the same.

So that's exactly what I did:

```c
unsigned int score(const char *word) {
    uint128 letter_scores = *(uint128 *)letter_scores_arr;
    unsigned int total = 0;
    while (*word) {
        int index = tolower(*word++) - 'a';
        total += (letter_scores >> index * 4) & 15;
    }
    return total;
}
```

By treating the array address as a pointer to `uint128`, then dereferencing, I have the original number back! (This probably violates the strict aliasing rule, so don't do it.) From there, it's a simple(ish) matter of bitshifting it by 4 times each letter's index, and masking off only the low 4 bits. Do this for each letter, and we get the full score!

### How to Make Big Numbers

How did I actually get to those massive numbers in the C solution though? First, you'll need to understand the structure that they must have. When looking up the score for the letter "a", the number is not shifted at all, and the lowest 4 bits are used. For "b", it's shifted over by 4 bits, then the new low 4 bits are used.

This means that the number must include the score of "a" in the lowest 4 bits, then "b" in the next 4, and so on. Additionally, for the array workaround, the lowest 64 bits must be written first, in order to end up with the right binary representation in memory.

To create the numbers, I used Python, reusing the `SCORES` dictionary from earlier. Python supports arbitrary precision integers, so I don't need to worry about size, and the simplicity of Python makes it easy to put together quick temporary scripts like this.

```python
number = 0
for score in reversed(SCORES.values()):
    number = number << 4 | score
print(number)
print(number & ((1 << 64) - 1), number >> 64)
```

I handled the bit order by shifting in each score, starting with Z and continuing all the way to A. By the time A's score is added, Z will have been shifted 100 bits to the right, putting it in the correct location. To split the number into two 64-bit values, I just manually shifted and masked the right bits.

## Summary

From a one-liner\* in Python, to a very silly C solution, I think I was able to get a lot out of a reasonably simple exercise here. I'm a little surprised that a task like this came so quickly after a mathematically involved one like Sieve, but sometimes the simple tasks can be fun to explore. If you want to see the full solutions, I've published them all:

- [Python](https://exercism.org/tracks/python/exercises/scrabble-score/solutions/soxfox42)
- [Scheme](https://exercism.org/tracks/scheme/exercises/scrabble-score/solutions/soxfox42)
- [C](https://exercism.org/tracks/c/exercises/scrabble-score/solutions/soxfox42)

\* Just pretend `SCORES` doesn't exist.

