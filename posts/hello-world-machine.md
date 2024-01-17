## Introduction

_For the purpose of this article, all the code will be in Python._

In their [#48in24 challenge](https://exercism.org/challenges/48in24), Exercism are exploring how the community approaches different coding challenges.
"Hello, World!" is the most basic exercise on Exercism and was deemed too simple to make an official video for.
But I'm not so sure, and thought it might be fun to look at some more interesting approaches to this simple exercise!

## Meet "Hello, World!"

"Hello, World!" is probably the most famous program in the world.
Virtually anybody who's learned to code has written it at least once.
Its simplicity and the friendly message often signify the first step into the wonderful world of programming.

On Exercism, you are provided with a function named `hello` that returns "Goodbye, Mars!".

```python
def hello():
    return 'Goodbye, Mars!'
```

Your task is to change it to return "Hello, World!" instead.

## The Traditional Approach

First up, we have the most simple approach, and the one Exercism hopes you'll implement.
With just a simple change of string from "Goodbye, Mars!" to "Hello, World!", we can now safely return it!

```python
def hello() -> str:
    return 'Hello, World'
```

## Alternative Approaches

I'm going to solve this exercise using all the various methods that I could think of.

For narrative purposes, I will refer to this simple function as the "machine", a machine whose only job is to return a "Hello, World!" greeting.

Let's see where this goes...!

### The Join

The machine already knows some of the words, but it can't seen to string ah, eg, well, string them together.

```python
def hello() -> str:
    words = ["Hello", " world!"]
    return ",".join(words)
```

### The Title

The machine's battery is a bit low today as all the words are lacking energy and are not being capitalized properly.

```python
def hello() -> str:
    words = "hello, world!"
    return words.title()
```

### The Reversal

The machine somehow knows the greeting, but something about it looks a bit ..backward.

```python
def hello() -> str:
    sdrow = "!dlroW ,olleH"
    return sdrow[::-1]
```
**Note:** [`Reverse String`](https://exercism.org/exercises/reverse-string) is a featured exercise for the #48in24 challenge, remember to check out various approaches of how to do it in different languages!

### The Slice 'n Dice

Maybe the machine need to have its oil changed, the normal greeting message seems to be a bit mixed up.

```python
def hello() -> str:
    w = "Holld, Werlo!"
    return f"{w[0]}{w[8]}{w[2:4]}{w[1]}{w[5:8]}{w[-2]}{w[-4:-2]}{w[4]}{w[-1]}"
```

### The Curry

Oh oh, some parts of the machine are in maintenance mode.
It forgot the greeting message and can now only accept the message part by part.

```python
def hello(greet: str):
    def world(location: str) -> str:
        return f"{greet}, {location}!"
    return world

hello = hello("Hello")
hello("World")
```

### The Ascii

You accidentally spilled some lemonade on the machine and now it only shows you these strange numbers instead of the usual characters in the message.

```python
def hello() -> str:
    ascii = [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
    return ''.join(chr(value) for value in ascii)
```

### The Dictionary

You watched the news and saw a snippet about a man being rescued using an S.O.S signal.
"Maybe the machine should be able to handle morse code as well!" - you thought, but you are not sure why.
Its only job is to return the greeting message...

```python
def hello(morse) -> str:
    morse_code = {
        "...."  : "H",
        "."     : "e",
        ".-.."  : "l",
        "---"   : "o",
        "--..--": ",",
        "/"     : " ",
        ".--"   : "W",
        ".-."   : "r",
        "-.."   : "d",
        "-.-.--": "!"

    }
    return "".join(morse_code[value] for value in morse.split())

print(hello(".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--"))
```

### The Functional

With your current machine prone to changes and damage, you decide to build a smaller but immutable and indestructible machine that does the exact same thing.
Whenever the regular machine is not working or acting up, it will activate the smaller one instead.
Hang on, why don't we just use the smaller on from now on..

```python
def hi() -> str:
	return "Hello, World!"

def hello() -> str:
    return hi()
```

### The Permutation

A strong thunderstorm passed by and your poor unlucky machine got struck by lightning.
It still powers up, but now it is acting weird.
All the characters to assemble the greeting message are still there, but they are not in order and the damage to the logic board means the machine can't get the order for the message right anymore.
And just your luck, the incredibly reliable and *indestructible* smaller machine you built earlier was in fact stealable (yes, it's gone!).
Therefore, you decide to just let your good ol' buddy try every possible way to scramble these letters into the correct message.
After all, it is only 13 characters and the machine has a lot of memory, this should be quick...

```python
from itertools import permutations

def hello() -> str:
    chars = ['H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!']

    all_permutations = permutations(chars)
    for perm in all_permutations:
        if ("".join(perm) == "Hello, World!"):
            return ''.join(perm)
```

### The Search

You decided to update the machine to allow it to greet in different languages.
But its ONLY job is to say "Hello, World!" in English, so in its confusion it decides to download a bazillion ways of saying "Hello, World!", each with slightly different capitalized characters and placement.
That left you confused and not sure which one to pick, but at least they are all in some sort of order.
You have to tell the machine the correct way to phrase it, so it can find the phrase and be normal again(maybe).

```python
def hello(my_fav_phrase) -> str:
    combinations = [
        "HELLO, WORLD!",
        # many many many items later,
        "hello, world!"
    ]

    lower = 0
    upper = len(combinations)
    while lower <= upper:
        mid = (lower + upper) // 2
        mid_val = combinations[mid]

        if mid_val == my_fav_phrase:
            return combinations[mid]
        elif mid_val < my_fav_phrase:
            lower = mid + 1
        else:
            high = mid - 1
    return "Error: Can't find {my_fav_phrase}"

hello("Hello, World!")
```

Your younger brother, who has been watching the whole thing, asked why you didn't just delete the whole mess, and then give the machine the correct phrase for it to remember.
You didn't reply and just glared at him.

### The Classy

You decide to experiment and tweak the machine to behave differently based on what button is being pressed.
You thought about making it a bit more casual, starting to say "Hi". but being a *classy* person, you decide to only ever use the `hello` method and tape over the other one.
You realize you have quite a lot of time on your hands for these things..

```python
class Greeting:
    location = "World"

    def __init__(self) -> None:
        pass

    def hello(self):
        return f"Hello, {self.location}!"

    def hi(self):
        return f"Hi, {self.location}!"

salutation = Greeting()
salutation.hello()
```

### The Recursion

For some reason, you decided it would be funny if the machine lagged a bit and would only respond 10 seconds late. Your brother once again raises the question about the logic behind this feature, because according to him, you are the only one who uses the machine.

```python
import time

def hello(n=10):
    if n == 0:
        return "Hello, World!"
    else:
        time.sleep(1)
        return hello(n-1)
```

### The Randomness

Suddenly, one day you just feel tired of the same greeting over and over again, so you decide that you would let it greet you one last time and retire the machine for good, never to touch it again.
As the machine has been with you through thick and thin and for a long time, you decide to let this final meeting between "friends" to be in the hand of fate.
 You power it up one last time and just let it spin...

```python
import random

def hello():
    chars = list("Helo,Wrld!")
    greeting = ""
    while (greeting != "Hello, World!"):
        greeting = "".join(random.choices(chars, k=13))
    return greeting
```

### The End

That was a wild tour through my mind.
I'm not sure it was useful, but it was definitely fun.

Thanks for reading and happy coding!
