## Introduction

*For the purpose of this article, all the code will be in Python.

"Hello, World!" is without a doubt the most famous program in the world, virtually anybody who learn to code have seen it at least once.
Its simplicity and the friendly message being printed out to greet a newcomer often signify the first step into the wonderful world of programming.

But for practical reason, it is often used as a first test basic to make sure that the computer language you are about to use is being installed and set up correctly, and the user understand the very basics of how to use it. And this is no difference here on Exercism.

The usual set up is a function (class/module) named `hello` with an included string of "Goodbye, Mars!" to be returned with a string "Hello, World!"

```python
def hello():
    return 'Goodbye, Mars!'
```

Next, I will attempt to solve this quandary using various methods that I could think of. And for narrative purpose, I will refer to this simple function as *the* MACHINE!! whose only job is returning a greeting of : "Hello, World!". Let's see where it goes.


#### The Traditional

```python
def hello() -> str:
    return 'Hello, World'
```

With just a simple change of string from "Goodbye, Mars!" to "Hello, World!", we can now safely return it.

#### The Parameter

You decide maybe it is a good idea to give the machine an input of the phrase, so it can remember it for later usage.

```python
def hello(greeting: str) -> str:
    return greeting

hello("Hello, World!")
```

#### The Named Parameter

After the previous attemp, the machine only managed to remember where is it but it can't remember the greeting, so you need to put in the greeting again.

```python
def hello(greeting: str, location="World") -> str:
    return greeting + ", " + location + "!"

hello("Hello")
```

### The -join

The machine already have some of the words, but it can't seen to string a ~~sen-~~ string together.

```python
def hello() -> str:
    words = ["Hello", " world!"]
    return ",".join(words)
```

#### The Title

The machine's battery is a bit low today, all the words are lacking energy and not being capitalized properly.

```python
def hello() -> str:
    words = "hello, world!"
    return words.title()
```

#### The Reversal

The machine somehow have the greeting ready, but something about it looks a bit ..backward.

```python
def hello() -> str:
    sdrow = "!dlroW ,olleH"
    return sdrow[::-1]
```
**Note:** `Reverse String` is a featured exercise for the #48in24 challenge, remember to check out various approaches of how to do it in different languages!

#### The Slice 'n Dice

Maybe the machine need to have its oil changed, the normal greeting message seem to be a bit mixed up.

```python
def hello() -> str:
	w = "Holld, Werlo!"
	return f"{w[0]}{w[8]}{w[2:4]}{w[1]}{w[5:8]}{w[-2]}{w[-4:-2]}{w[4]}{w[-1]}"
```


#### The Curry

Oh oh, some parts of the machine is in maintenance mode. It forgot the greeting  message and now can only accept part by part back.

```python
def hello(greet: str):
    def world(location: str) -> str:
        return f"{greet}, {location}!"
    return world

hello = hello("Hello")
hello("World")
```

#### The Ascii

You accidentally spilled some lemonade on the machine and now it only show you these strange number instead of the usual characters in the message.

```python
def hello() -> str:
    ascii = [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
    return ''.join(chr(value) for value in ascii)
```

#### The Dictionary

You watched the news and saw a snippet about a man being rescued using S.O.S signal. "Maybe the machine should be able to handle morse code as well!" - you thought, but you are not sure why. Its only job is to return the greeting message...

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

#### The Functional

With your current machine are prone to changes and damage, you decide to build a smaller but an immutable and indestructible machine that do the exact same thing. And whenever the regular machine not working or acting up, it will activate the smaller one instead. Hang on, why don't we just use the smaller on from now on..

```python
def hi() -> str:
	return "Hello, World!"

def hello() -> str:
    return hi()
```

#### The Permutation

A strong thunderstorm went by and your poor unlucky machine got struck by lightning, it still power up but now it is acting weird.  All the characters to assemble the greeting message is still there but they are not in order, and the damaged to the logic board mean the machine can't get the correct order for the message anymore. 
And just your luck, the incredible reliable and *indestructible* smaller one you built earlier was in fact stealable (Yes, it's gone!). So you decide to just let your good ol' buddy to try every possible ways to scramble these letters into the correct message. After all, it is only 13 characters and the machine has a lot of memory that you recently downloaded, this should be quick...

```python
from itertools import permutations

def hello() -> str:
    chars = ['H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!']

    all_permutations = permutations(chars)
    for perm in all_permutations:
        if ("".join(perm) == "Hello, World!"):
            return ''.join(perm)
```

#### The Search

You decided to give an update to the machine, make it learn new language so it can greet in different languages. But its ONLY job is to say "Hello, World!" in English, so in its confusion it decides to download a bazillion ways of saying "Hello, World!", each with slightly different capitalized characters and placement. Now it confused and not sure which one to pick, well, at least these are all in some sort of order. You have to tell machine the correct way to phrase it, so it can find the phrase and be normal again(maybe)

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

Your younger brother who has been watching the whole thing asked why didn't you just delete the whole mess, then give the machine the only correct phrase for it to remember, you didn't say anything and just glare at him. 

#### The Classy

You decide to experiment and tweak the machine to behave differently based on what button being pressed. You thought about making it a bit more casual, starting to say "Hi". But being a class*y* person, you decide to only ever use the `hello` method and tape over the other one. You realize you have quite a lot of time on your hands for these things..

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

#### The Recursion

For some reason you decided that it would be funny if the machine lag behind a bit and only response 10 secs late to prank people. Your brother once again raising the question about the logic behind this feature, because according to his word you are the only one who use the machine.

```python
import time

def hello(n=10):
    if n == 0:
        return "Hello, World!"
    else:
        time.sleep(1)
        return hello(n-1)
```

#### The Randomness

Suddenly, one day you just feel tired of the same greeting over and over again, so you decide that you would let it greet you one last time and retire the machine for good. Never to touch it again. But it has been with you for a long time through thick and thin, so you decide to let this final meeting between "friends" to be in the hand of fate. You power it up one last time and just let it spins.

```python
import random

def hello():
    chars = list("Helo,Wrld!")
    greeting = ""
    while (greeting != "Hello, World!"):
        greeting = "".join(random.choices(chars, k=13))
    return greeting
```

##### The End.