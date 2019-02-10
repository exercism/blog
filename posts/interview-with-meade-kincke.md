_An interview with [Meade Kincke](https://exercism.io/profiles/TheDarkula) in which he and Katrina Owen talk about the Rust compiler, a GUI that uses scientific colourspaces to determine the colour of beer, and his book 'A Practical Guide To Rust'._

**Hey Meade. Thanks for chatting. We wanted to talk with you because you’re the most prolific mentor that we have on the Rust track. You've helped over 400 students. How did you find out about Exercism?**

Someone on Reddit's Rust subreddit posted about how Exercism's Rust track needed mentors, so I looked into it. I'm so glad that I did because it's immensely rewarding and everyone has been so nice and appreciative. I've made some wonderful connections with my Exercism students, and I love helping them.

**Are there any particular stories that stand out?**

Yes, there's one particular Rust exercise that has been very popular: the Pythagorean Triplet.

The most common problem in this exercise tends to be performance. Most people solve it initially with nested `for` loops, which is at least O(n²) and is very inefficient.  My goal is to get my students to a linear solution: O(n).

My approach is to pose questions. I begin by asking if they want to learn Rust's iterator method because it has a ton of benefits, one of which is that you can use the Rayon library to parallelize your work.

After answering, "Yes, please," one of my students mentioned that he is learning Rust because he's looking at using it for embedded control and then to process its massive data output. Thus, parallelism is important to him. He was pleased that I took a seemingly simple exercise to teach more complex and idiomatic bits of Rust.

Now, thanks to Exercism, he's hired me on to teach him one-on-one, and we're going to work together on some experimental projects. I will also be teaching his entire team when he fully converts the company to Rust.

I've really enjoyed working with the students that I've mentored, and I want it to continue growing.

I like it so much that now I've volunteered to be a maintainer on the Rust track and help more behind the scenes.

**That human connection is so important! You're the author of [A Practical Guide to Rust](https://www.kobo.com/us/en/ebook/a-practical-guide-to-rust). What is that about and what were your motivations for writing it?**

I wrote this book to help others better understand certain aspects of [Rust](https://www.rust-lang.org/).  There's not a whole lot of documentation out there on the language, and I felt there needed to be literature that had humor and explained the concepts of the language tangibly.  It provides guides to some basic and advanced areas. I want people to get a solid sense of the practical, real-world use for the language. It gives real examples, not hypothetical ones.

I always knew that I was going to write a book. When I found myself teaching a colleague how to program in Rust remotely, the framework just fell into place. He had never touched any code before, and I needed to explain terms and methods that us nerds take for granted in new perceivable ways. I used analogies like borrowing a book from the library vs. owning the book when discussing the concept of ownership in Rust.

I also incorporated examples from my project [BrewStillery](https://gitlab.com/MonkeyLog/BrewStillery). It's a great way to see how things like structs and enums function in an actual program. It also shows how to use parallelism in a real way.

When writing the book, I knew I wanted it to read like a story instead of just a reference guide.  It builds on itself, but the elements do stand alone. It's the difference between cooking with a chemistry manual vs. watching an episode of Julia Child's "The French Chef."

**Oh, that's intriguing. Who did you write your book for and what would the reader get out of it?**

It's intended for anyone who wants to learn Rust. The equalizer with how I elaborate ideas is that it gives the reader a fundamental comprehension, whereas a great deal of other literature leans toward rote memorization.

**I see you've received a lot of positive reviews. Are you planning on putting out a Volume II?**

Yes! I will, of course, continue writing and plan on publishing more volumes.

**Aside from teaching through mentorship and writing, you've also done some work on the Rust compiler.  Can you tell me about that?**

Of course!

As a brief introduction to my work, there are essentially two places that a program can function: compile time and runtime.  When a function is executed at runtime, everything in it has to be regenerated and recomputed. This critically means reallocating memory, which we always want to avoid.  When a function is constant, it is loaded into memory when the program is started. The more we can do at compile time, the better our programs will perform.

A while back, I heard that this idea of [compile time function execution (const fn)](https://en.m.wikipedia.org/wiki/Compile_time_function_execution), was being implemented in Rust, and I got really excited. I'm very passionate about getting things to be efficient and accurate. One thing I really like about `const fn` is that when it's complete, we can have wonderful things like mathematical constants determined elegantly. Currently, [pi](https://doc.rust-lang.org/src/core/num/f64.rs.html#83) is a hard-coded value. A lot of people would say that this is accurate enough, but I feel that it should use the entirety of the available numeric space.  With `const fn`, we can use [Leibniz's formula](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80), which would fill the floating-point space completely.

I did a bit more reading and came across a blog post saying that [MIRI](https://github.com/solson/miri) would make stabilizing `const fn` much easier. Time went by, and I didn't see any progress when new versions were released. I contacted the Rust team and got started hacking on the compiler.

The great thing is the compiler itself is written in Rust. It was initially written in OCaml and then rewritten in Rust, which is called bootstrapping. Basically, the compiler parses all input in the [AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree), which is then handed off to the [high-level intermediate representation](https://en.wikipedia.org/wiki/Intermediate_representation) (HIR), then medium-level (MIR), and then low-level (LIR), which is handled by [LLVM](https://en.wikipedia.org/wiki/LLVM). As we walk through all those steps, we get closer and closer to machine code.

Something to understand is that the compiler is just a program, but a very elaborate one. Rust takes quite a while to compile and especially to run all of the tests for it. So you don't just slap some code in and get to say, "I'm done."

My first work on the compiler was on the HIR. It involved a tremendous amount of reading through the standard library (both stable and nightly) and following rabbit holes. I had to recurse all the way down through every nested type in the compiler until I had exhausted all options. The nightly/compiler library has a ton of nested types. Keeping what thread you're following down requires a lot of focus.

To make matters more complicated, the compiler is worked on by a distributed team, which means that we often end up with merge conflicts.

It was so much fun. There's still a ton of work to be done, which I'll get to in the near future.

**In addition to these open source contributions, I know you're CTO of a blockchain company. I associate blockchain with me losing lots of money on Etherium. What does it mean to you?**

Blockchain has, unfortunately, become the buzziest buzzword that ever did buzz.

It is much more than The City and Wall Street cashing in on a new trend for digital currency. We are actually not a “blockchain company”, we at [Chainetix](https://chainetix.com/) provide private ledgers to secure a company’s data securely. In fact, we don’t even deal in crypocurrency. The aim at Chainetix is to bring our expertise into the hands of everyone who has a basic understanding of programming.

My work has involved mapping out our systems and infrastructure from scratch to create something rock-solid. I chose a project called [Habitat by Chef](https://www.habitat.sh/). I found out about it because it's written in Rust, which was intriguing coming from such a huge company like Chef. In contrast to plain Docker, Habitat creates images that can automatically update themselves and do amazing things like service bindings. I've also contributed quite a bit to Habitat's [core-plans](https://github.com/habitat-sh/core-plans/) repository.

**Earlier you mentioned your project, BrewStillery. It sounds like it's important to you. Can you tell us a bit more about that?**

Yes, it definitely is!

[BrewStillery](https://gitlab.com/MonkeyLog/BrewStillery) is an open source, all-in-one beer, wine, and spirits tool that I wrote in Rust and [GTK3](https://gtk-rs.org/).  I also added a CSS theme that is beautifully unique. In a sentence, it's an advanced calculator for anyone making spirits.

I’ve created different tabs to separate the calculators that are specific to beer and champagne while having a general tab that applies to brewers, vintners, and distillers alike. If you look at most beer and wine bottles, you’ll see the percent of alcohol in that bottle—the Alcohol By Volume. Well, one of the things that BrewStillery does is determine that ABV. As you can probably guess, there’s a bunch of nerdy awesomeness involved here. The thing I'm most pleased about is calculating the beer color:

![BrewStillery Beer Tab Empty Glass](https://assets.exercism.io/blog/introducing-thedarkula-BrewStillery_Empty_Glass.png)

![BrewStillery Beer Tab Full Glass](https://assets.exercism.io/blog/introducing-thedarkula-BrewStillery_Full_Glass.png)

These before and after images show what happens after you’ve entered amounts. The way I’ve done it is something that no one’s done previously. Another great feature is that it’s all calculated on the fly as you type. If you want the gritty details about colorspaces, hit me up at a conference and we can talk about it over pints!

