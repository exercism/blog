**Spoiler Alert: This article has spoilers for the Grains exercise in general and specifically the Grains exercise on the Bash track.  If you haven't completed it yourself, yet, and you don't want to be shown some solutions, come back once you've finished it!**

It's your first day at a new company.  You've done all the paperwork, met the team, and it is finally time for you to sit down and start reading some of the code that you'll be working on.  You start to read through the different functions, classes, and modules, and, as you read, you find yourself starting to squint at the screen in confusion.  You keep reading and single word escapes from your mouth, barely spoken, almost breathed: "Whaaaaaaaaaat..."[^1]  The more you go on, the more this happens as you get more bewildered and even a little angry.  

> What is happening in this code?  It's so complex, and it's *way* different from how I usually write my code!

Anytime there's more than one person working on a piece of code, the amount of care and deliberateness required to keep things sane goes *way* up.  It's no longer the concept that lives in your brain and the code that just has to make that concept happen.  Now, the concept has to live *inside the code* where all the collaborators can see it and change it if need be.

*How* you go about implementing something doesn't mean much to the end user, but it should speak *volumes* to every engineer that touches your design at any point.  There are often a lot of ways to achieve the same functionality, and it might seem like any of the options would be sufficient to get the job done.  However, I believe that every single decision you make should have a reason (even if it's a small decision with a small reason), and that reason should communicate an objective or requirement.

The idea that implementation details should help readers of code discern thought process, goals, and priorities is called **design intent**.  How you name your variables, what parameters your function takes, and how things are abstracted are all places where the design intent can be expressed — either well or poorly.

I'm a firm believer that design intent is one of the most important things to consider when implementing an engineering design.  It's one of the things that sets Software Engineering apart from programming.  

 > Software engineering is what happens to programming when you add time and other programmers.
 >
 > — [Russ Cox](https://research.swtch.com/vgo-eng)

## Design intent is cross-discipline

I work as a mechanical engineer, designing [injection molds](https://youtu.be/WHwTHarf8Ck?t=51), mostly for medical devices.  All of my designs, once they're finished, go straight out the door into the machine shop, where they start making all the pieces and assembling them together.  Since they don't know everything that went through my head as I was creating each design, I have to find a way to *show* my intent through the design itself.

A lot of times, there are features that are especially critical.  Either the customer has said that they need special tight tolerances there, or the way the mold fits together requires extreme accuracy for some reason.  So, in order to help the machinists create the pieces in a way that will prioritize accuracy on the important bits, I have to leave spots that are specifically square or easy to put in a vice a particular way.  That way, the easiest path for them produces the best results for me.

There are also spots where the dimensions aren't as critical.  For example, if I put a hole in the design that's just for an air vent, I'll make it a nice common size like 1/4", which is .250".  

>  I'll put a parallel metric example in parenthesis (6mm).  The numbers aren't exactly the same, but the illustrational effect will be similar.

When they're machining this hole and they go to measure how it came out, if they see a number like .2496" (or 5.99 mm),  they'll think, "OK, this was probably supposed to be 1/4" (6mm), so I'm pretty close," and they won't even have to go double-check the dimensions on the CAD or the specification drawing.  Instead, if I was to make it something uncommon, like .212" (or 5.87 mm),   they would look at it, and have this initial reaction:

1. Oh, shoot, did I come in super undersized?  Was it supposed to be 1/4" (6mm)?
2. (They go check the CAD and see that their hole is good and it's just an uncommon size.)
3. Hmmm.  I'm sure this hole is an uncommon size for a reason.  Maybe it's really important or the customer asked for a special hole here.  I'll need to go talk to Ryan and see what's so important about this hole.
4. (SLAM!  They set the chunk of aluminum on my desk daintily.)
5. (They find out that there's nothing important about this hole, I just picked a weird size, and all of this extra work and worry was for no reason.)
6. Boy, that Ryan guy, he's a real piece of work. (grumble, swear word, grumble)

All of this happens because every decision of my design communicates something to the other people looking at it and working on it, whether I mean for it to or not.  They *have* to see meaning in it, because it's the only information they have to go on!  So, it's much better if I can take the time to put *meaningful*, **intentional** information in my design.

## Grains: an introduction

Now, let's talk about how design intent can be communicated in code, using an example from one of the Exercism exercises.  I recently worked with a student on their solution to the *Grains* exercise on the Bash track.  *Grains* is an exercise that addresses the [wheat and chessboard problem](https://en.wikipedia.org/wiki/Wheat_and_chessboard_problem).  In short, one grain of wheat is put on the first square of a chessboard.  Two grains go on the next square.  Four grains go on the next square.  And so on, with each square having double the grains of the previous.  Students are asked to find a way to calculate the value on each individual square as well as the overall total number of grains on the board.

This particular student came up with a pretty clever way to calculate the total.

```bash
bc <<< 'ibase=16;FFFFFFFFFFFFFFFF'
```

`bc` is a command-line calculator.  You can pass it strings of arithmetic and it will evaluate them, even for very large integers and floating point numbers.  There are other ways to do calculations without using `bc` in Bash, but, for the sake of simplicity, we'll be looking at how intent can be communicated—or not—while using `bc`.

This solution works because the whole exercise revolves around powers of two — and where there are powers of two, there's binary, and where there is binary, there's hexadecimal[^2]!

It is a clever solution, but what is the code telling us?  That hexadecimal is important here?  That the problem fundamentally revolves around 16?  After re-reading the problem statement, it's pretty clear that neither of those are the case.  The student and I brainstormed some ideas for how to more clearly communicate intent.  Here are a few things we came up with:

### First option: binary

Because we've got a bunch of things doubling (and thus, a bunch of powers of 2), let's look at what's happening in binary to see if that will help us.

---

The first square has 1 grain on it.  In binary, this would also be `0b1` (the `0b` just meaining "this is a binary number", with the actual number being `1`).

The second square has 2 grains on it.  In binary, `0b10`.  The total so far is 3 (or `0b11`).

The third square has 4 (`0b100`) grains on it.  Total so far: 7 (`0b111`).

The fourth square has 8 grains (`0b1000`).  Total so far: 15 (`0b1111`).

---

Can you see the pattern?

Each square represents another binary digit, and adding all of them together just makes a bunch of 1's.

In the student's solution, we could replace the F's with 64 1's (one for each square)!

```bash
bc <<< "ibase=2;1111111111111111111111111111111111111111111111111111111111111111"
```

More intentional, because it more closely matches what the problem gives us.  But, we don't speak robot.  A long, essentially uncountable string of 1's is maybe not an improvement.

### Second option: the brute-force calculation

OK, so maybe we abandon the non-decimal numbering systems altogether.  Why don't we make the code match how we would total up the number of grains on a chessboard by hand, by counting the grains on each square?

```bash
total=0
current_grains=1
for square in {1..64}; do
  total=$( bc <<< "$total + $current_grains" )
  current_grains=$( bc <<< "$current_grains * 2" )
done
echo "$total"
```

That's a lot more readable and understandable.  The code clearly shows that the number of squares on the chess board is a driving factor, as well as the doubling effect for each square.  I think this is better than the initial solution.

However.

It's slow.  Looping, adding, and repeatedly calling out to an external command?  They all stack up to a slow-ish run-time.  Now, is that a huge deal?  No.  If you're scripting this in Bash, you've probably already decided you don't have speed constraints.  But could it be better?  Yes.

### Third option: direct calculation

So, how do we add all these up without iterating?

Let's consider a *smaller* version of the same problem: a chessboard with 5 squares[^3].

The five squares would have the following number of grains:

```txt
---------------------
| 1 | 2 | 4 | 8 |16 |
---------------------
```

And the total here would be: 1 + 2 + 4 + 8 + 16 = 31.  Hm.  31 doesn't scream anything obvious at me yet.  Let's go a little bigger.

OK, well what about a 6-square chessboard?  This time, I'll show the running total below each square to help us add it up.

```txt
-------------------------
| 1 | 2 | 4 | 8 |16 |32 |
|   | 3 | 7 |15 |31 |63 |
-------------------------
```

And the sum: 1 + 2 + 4 + 8 + 16 + 32 = 63.  Hmm... I'm actually starting to see a glimmer of a pattern, but we'll do one more just to be sure.

7 squares:

```txt
-----------------------------
| 1 | 2 | 4 | 8 |16 |32 |64 |
|   | 3 | 7 |15 |31 |63 |127|
-----------------------------
```

1 + 2 + 4 + 8 + 16 + 32 +64 = 127.  Do you see it?  Anything ringing any alarms with the values 31, 63, 127?

They're *almost* powers of 2.  In fact, they're *one less* than the *next* power of two.  

One more example, to drive it home.  Imagine a 12-square chess board. That's twelve doublings, or 2 multiplied by itself 12 times (which, in the math biz, is 2^12): 4096. Double that again and you get 8192 (2^13). So... if we got the pattern right, the running total would be *one short* of 8192, also known as 8191. And if we tally it up, that's, exactly what we get: 1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 + 256 + 512 + 1024 + 2048 + 4096 = 8191.

> To put it another way, to find the total for all `n` squares, all you need is the value on square `n + 1` minus one.

Soooooo, if we want to total up all of the squares up through square 64, all we need to do is calculate the number of grains on *square 65* and subtract 1.

Blammo.

In Bash, to calculate the value on any particular square according to our new pattern, it will look like this:

```bash
bc <<< "2^($square - 1)"
```

More specifically, for the "65th" square, that would look like this:

```bash
bc <<< "2^64"
```

And to calculate the total of all of the squares that come before it (all 64 of our chessboard squares), all that's left is to subtract 1!

```bash
bc <<< "2^64 - 1"
```

This makes sense when you confirm what's happening with binary.  In binary, what was the total of all 64 squares?

```txt
0b1111...  # 64 ones
```

What's the number of grains on the theoretical 65th square?

```txt
0b10000... # 1 and 64 zeros
```

How do you get from 1 and 64 zeros down to 64 ones?  You subtract 1.

And what additional benefit does this give us?  Well, now we've got a nice, readable expression for the total.  It doesn't iterate, so performance is good.  And it contains the number 64, which is the number of squares on a chessboard, which is a good example of well-signalled **design intent**.  If, for some reason, in 1000 years, the world standardizes on a 7x7 chessboard, that future engineer (probably using Bash 6.1) will check the script, see what you were going for, and change the 64 to a 49.  All good!

## Stay intentional, my friends

When working out an implementation, it's easy to throw things around and latch onto the first solution that works, and that's fine while you're exploring the problem, but once you fully understand the critical components — if you've got the time to spend giving things a good polish — make sure every algorithm, every variable name, and even your white space draw a picture of the problem, the critical requirements, and how all the pieces fit together.

A *huge* thank you to @kytrinyx for all of her feedback and help with this post.  Much of the wisdom, clarity, and friendly explanations are thanks to her.  And @iHiD, who helped me get started and then published.

[^1]: See also [Thom Holwerda's comic.](https://www.osnews.com/story/19266/wtfsm/)
[^2]: If you're feeling a little rusty on your binary and hexadecimal counting, @kytrinyx recommends the book [How to Count](https://www.amazon.com/Count-Programming-Mere-Mortals-Book-ebook/dp/B005DPIKPE).  As a shameless plug, I recently wrote [a couple blog posts about binary and hexadecimal too.](https://www.assertnotmagic.com/2018/09/10/binary-hexadecimal-part-1/)
[^3]: I don't know how that would work.  Maybe we could just have pawns joust at each other.
