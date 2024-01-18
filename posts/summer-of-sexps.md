## Introduction
Hi everyone! I hope you’re all doing well.

It’s been a really exciting few weeks at Exercism, with the launch of Exercism Premium and Exercism Insiders. We’ve also had some great community calls, and got lots of improvements to the site deployed and coming soon. There’s lots to be excited for at the moment, but nothing more exciting than us entering month 6 of #12in23! - The summer of S-expressions, or more nicely shortened to the Summer of Sexps.

As normal, I’m joined by the wise sage of the programming world - Erik.

So we have five languages this month: Clojure, Common Lisp, Emacs Lisp, Racket and Scheme. Each of these languages is a dialect of the Lisp language, and so rather than focussing too heavily on the different languages in this video, we’re going to look a little more at Lisp itself, and what makes it unique. And then we’ll finish by going over the languages in brief.

But before that, some housekeeping! To get the Summer of Sexps badge you need to complete any five exercises in one of those languages during June.

## The badges

There’s also the year long 12in23 badge. To get that, you need to solve five of our featured exercises in the language. If you’re watching this after June, you can do this bit at any time during the year, so you’ve not missed out. As many people will have never worked with a Lisp, we tried to choose relatively simple exercises that give you a taste for what a Lisp language looks like.
- **Leap:** work with boolean conditions and truthiness (and optionally, lexical scoping)
- **Two-Fer:** format a string and work with an optional parameter
- **Difference of Squares:** call user-defined functions and do math in prefix notation
- **Robot Name:** Work with randomness, atoms, and structured data
- **Matching Brackets:** use recursion to validate a string

These exercises and the ones for previous months can all be found on the the #12in23 page.

## Overviews

So Lisp-based languages. I guess, we should start with actually understanding a little about Lisp. Let's start with a little introduction into Lisp in general.

### Lisp
- The first thing to note is that Lisp is one of the oldest languages.
- It was created by John McCarthy at MIT in 1958, back when computers would still occupy entire rooms from top to bottom 🙂
- The name Lisp stands for LISt Processing (or LISt Processor), showcasing the importance of the list data structure.
- It was designed with the purpose of doing AI research.
- Lisp was based on lambda calculus, invented by Alonzo Church, which is a formal system to describe computation in math (simplified).

- It is an incredibly influential language, for various reasons:
- It is the second oldest high-level programming language still in common use (after Fortran)
- It was the first high-level functional programming language and introduced many of the features we now associate with functional programming.
- Note that Lisp still supported imperative programming
- It was the very first language with a garbage collector, freeing the author from having to do manual memory management
- Its comparatively little syntax and relatively simple semantics make it great for education purposes.
- Lisp (or better: one of its dialects) is therefore often used to teach programming
- It has spawned (and still spawns!) a great many language dialects (of which we’ll discuss those supported on Exercism).
- In other words, in the tree of programming language there is a separate branch for Lisp-like language (just as there is a branch of C-like languages).

When I talked to Simon Peyton Jones recently, one of the creators of Haskell, he was talking about the difference between languages built around Turning Machines and languages built around Lambda Calculus. So it’s worth checking that interview out if you’d like to know more about that.

### Parentheses

There are a lot of parentheses in Lisps, but that’s not necessarily a bad thing (just like having many curly braces isn’t necessarily bad in C-like languages).
Lisps are based around a thing that’s called: S-expressions.
An S-expression (short for symbolic expression, abbreviated as sexpr or sexp, hence the name of this month’s challenge) is an expression to represent data. They were invented for and popularized by the original Lisp language.
An S-expression can be one of two forms:

- An atom (e.g ‘x’).  Think of these as non-nested “values” or the leafs in the tree
- An expression x . y, where x and y are S-expressions.  Think of these as pairs, where y can is the next element in the list (if any), or nodes in a tree.  Note that this is a recursive definition, which terminates at the leaf level.  Usually, parentheses are used for this type of S-expression.


### S-expressions
S-expressions are used to represent both data and lists in Lisp.
Therefore, any time you define a list, you’ll use parentheses.
Combining this with the fact that:
the list is the core data structure of Lisp (hence its name),
in some Lisps it is the only data structure,
you’ll end up with a lot of parentheses.
To show how core lists are, if you want to call a function in Lisp, you do that by creating a list.

Interestingly, the first element of the list (aka the head) represents the function being called, and the other elements (aka the tail) are passed as the arguments.
This is known as prefix notation (where the operator comes before the operands), which can be somewhat weird at first, but is actually very useful:
- You can apply an operator on multiple arguments without having to repeat the operator (e.g. (+ 1 2 3))
- Operator precedence is made explicit, as you have to define a new S-expression to call a different operator anyway

Interestingly enough, lists are even used to represent the source code, but we’ll come back to that later.

In general, most Lisps have quite minimal syntax and relatively simple semantics, which makes them relatively easy to learn, and understanding code becomes easier too.
This minimal syntax does not make them less powerful!
Combining these two things (minimal syntax + simple semantics) makes Lisps ideal for writing compilers and interpreters for.
If you ever want to build your own compiler, building a Lisp is a good option!

### Cool features of Lisp

As mentioned before, Lisps uses the same data types and data structures internally to represent the code.
This property is called homoiconicity (or homoiconic).
In other words, a language is homoiconic if a program written in it can be manipulated as data using the language, and thus the program's internal representation can be inferred just by reading the program itself.
This property is often summarized by saying that the language treats code as data.

## Languages

### Scheme
- Created during the 1970s by Guy Steele and Gerald Sussman at the MIT AI Lab.
- Started as an attempt to understand Carl Hewitt's Actor model via a tiny Lisp interpreter.
- The language itself was introduced in a series of research AI Memos which have become collectively termed the Lambda Papers.
- First Lisp dialect to use Lexical scoping (values are only in scope where they’re defined) and one of the first languages to support first-class continuations.
- Official IEEE standard and a de facto standard called the Revised Report on the Algorithmic Language Scheme (RnRS).
- Many implementations: ChezScheme, Guile (both supported on Exercism), MIT/GNU Scheme and Racket
- Very minimal language, with little syntax, but that was not intentional.
- The authors tried to build something complicated but ended up designing something much simpler than they intended
- Proper tail recursion. Idiomatic way to do iteration is via recursion.
- Scheme optimizes tail recursive calls as to not consume stack space or other resources. This means recursion can be used on arbitrarily large data or for an arbitrarily long calculation
- Powerful numeric data types, including rational and complex numbers
- Delayed evaluation, which is like promises.
- Powerful macro system.
- Hygienic macros reduce the likelihood of unexpected results when defining macros.

### Common Lisp
- Work on Common Lisp started in 1981 after an initiative by ARPA manager Bob Engelmore to develop a single community standard Lisp dialect, because the various dialects in use were often incompatible which meant that code/knowledge was not shareable
- The first standard was published in 1984 and the final one in 1994 (very stable spec)
- Being a standard, there are different implementations of the standard, like Steel Bank Common Lisp (which is Exercism’s default) and CLisp.
- There are also commercial implementations, such as Allegro CL and LispWorks, as well as a ECL (Embeddable Common Lisp) which can be embedded in C programs and ABCL which runs on the Java Virtual Machine.
- Defined by Standard (ANSI INCITS 226-1994) so code written 30 years ago still runs fine today
- Rich and extensible type system
- Designed for image and REPL development so very introspect-able.

### Emacs Lisp
- Developed in 1985 for the purpose of having an efficient language to extend a text editor
- Dynamically typed
- ~80% of Emacs is written in Emacs Lisp (20% in C for performance reasons)
- Bit different from other Lisps:
- Not standardized, still slowly evolving
- No automatic tail-call elimination, support via named-let macro (transforms to while-loop)
- Dynamic scoping by default, lexical scoping for new code recommended
- Good documentation inside the editor
- Multi-platform (runs everywhere where Emacs runs)
- Learn the language by reading the code for functionality you’re using daily (Emacs Core + Packages)
- Subset of Common Lisp available via cl-lib package. Whereas Emacs Lisp is fairly minimalist, Common Lisp is much more full featured. The cl-lib package makes a subset of CL available

### Racket
- Matthias Felleisen founded PLT Inc. which in January 1995 decided to develop a pedagogic programming environment based on Scheme. Originally named PLT Scheme, it was later renamed to Racket.
- Besides being a pedagogic programming environment, it was designed as a platform for programming language design and implementation.
- Modern LISP, descendant of Scheme
- Supports logic programming!
- Simple, expressive syntax that’s both ideal for beginners and powerful in the hands of experts
- Supports many programming paradigms: functional programming, object-oriented programming, design by contract, logic programming, metaprogramming
- A comprehensive standard library
- Comes with DrRacket, a complete IDE designed for learning and exploration with a minimum of hassle
- Excellent documentation with plenty of background information and examples

### Clojure
- Developed by Rich Hickey with the goal of having a modern LISP that runs on the JVM and with great concurrency
- Dialect of LISP, but also somewhat different from other LISPs in that it doesn’t support implicit tail recursion (don’t worry if you don’t know what this is) and has more data structures than just lists: maps/sets/vectors. These data structures all have their own literal syntax.
- They’re also all immutable, but still have great performance with O(log32 n) lookup which is “effectively” constant time
- Runtime polymorphism via multimethods and protocols
- Great JVM interop
- Clojure Spec data specification system (runtime, not compile-time), allows you to define structure of data, generate data, property-based testing and more

## Use cases

### Scheme
- Used in education to help teach computer science (influential Structure and Interpretation of Computer Programs uses Scheme).
- Used in AI. Used as scripting language, e.g. in GIMP (graphics editor), CAD tools (Computer Aided Design) and even movies, with Final Fantasy: The Spirit Within’s rendering engine management scripts

### Common Lisp
- Common Lisp is used in many places, e.g. artificial intelligence and research, but also commercial applications: NASA wrote autopiloting software of the Deep Space One spaceship in Common Lisp,Viaweb was written in Common Lisp, which was later acquired by Yahoo and rebranded as Yahoo Store!, and the first version of Reddit

### Emacs Lisp
- Emacs Lisp is used in, well, Emacs!
- At its core, Emacs is an interpreter for Emacs Lisp, a dialect of the Lisp programming language but with added extensions to support text editing

### Racket
- Used in education, as Racket was designed with an emphasis on supporting language creation, simplification, and analysis.
- Used in research, due to its extensible syntax and semantics make it suitable for designing and prototyping new languages and language features.
- Used in games, e.g. by John Carmack (of Doom fame) in an interactive scripting environment for VR and developer Naughty Dog used it for scripting (e.g. in Uncharted). Hacker News is written in Arc, also a Lisp, which itself is written in Racket.

### Clojure
- Clojure is used for many different things, including Docker acquiring Atomist in 2022, which is a container security and automation platform implemented in Clojure.
- The world’s largest user of Clojure is Nubank, a new bank, who acquired it a few years ago and now employs the core Clojure team.
- It’s used heavily for rapid prototyping, being dynamic and highly interactive.

## Programming perspective
All languages support the functional, imperative and symbolic paradigms.
Some of them also support OOP, most notably Common Lisp.

Lisps are mostly dynamic languages, although Racket supports static typings.

This does not mean that they’re all interpreted, as there is a mixture of: interpreted (without any compilation step), compiled to bytecode and then interpreted and directly compiled to machine code options.

### Scheme
- Minimalistic, with clear and simple semantics and few different ways to form expressions.
- Makes it easy to learn the language and understand code.
- For this reason, Scheme is also used often in many introductory Computer Science courses
- First class continuations.
- A continuation is a representation of the state of a program.
- Continuations can be used to model control flow (e.g. a `return` construct) or coroutines (which allow for multitasking)

### Common Lisp
- Extensible Object Oriented System with programmable method combinations (both in how sub/super-class methods are combined as well as before, after and around methods to allow extension of systems without modification of those systems)
- Programmable condition system (a super set of ‘exceptions’) which allow decoupling of recognition of conditions with the choice of how they are handled. The condition system is more flexible than exception systems because instead of providing a two-part division between the code that signals an error1 and the code that handles it,2 the condition system splits the responsibilities into three parts--signaling a condition, handling it, and restarting.
- Macros allow for extending the syntax of the language, not just generating boilerplate code. This helps one build a language to fit the domain rather than the other way.

### Emacs Lisp
- Great editor support and integration
- Can be used to customize Emacs while it’s running (“like doing brain surgery on yourself” :))
- Can be used in batch mode, in which the editor’s capabilities to process text are all available to you (such as buffers and movement commands)

### Racket
- Powerful macro system. Syntax sugar like threading macros are built on this. Macros are also hygienic, which is the answer to a simple ques­tion: a macro gener­ates code that gets deposited else­where. When that code is eval­u­ated, how should we deter­mine the bind­ings of the iden­ti­fiers inside? Hygienic macros reduce the likelihood of unexpected results when defining macros.
- Language oriented.
- Racket comes with the tools to write your own programming language or DSL, built on Racket’s macros.
- Several built-in languages, such as typed Racket (supporting statically checked type annotations) datalog (a Prolog-like language), which DrRacket IDE support and scribble, a tool for creating prose documents in HTML of PDF form
- REPL core part of development workflow, not just for trying out thing, lookup docs

### Clojure
- Powerful macro system.
- Syntax sugar like threading macros are built on this
- REPL core part of development workflow, not just for trying out thing, lookup docs

## Which to try

- If you’ve never tried a Lisp, Scheme and Racket are great options as they both have very minimal syntax.
- That said, Common Lisp and Clojure both have Learning Mode, so those are probably the best to learn on Exercism.
- If you’re already using Emacs, Emacs Lisp is a natural choice.
- Similarly, if you’re using a JVM language, Clojure is a natural option.
- Emacs Lisp (via Emacs), Clojure (via IntelliJ) and Racket (via DrRacket) all have excellent IDE support.
- There are also good IDEs for Common Lisp and Scheme of course.
- If you want a really full-featured Lisp, Common Lisp, Clojure and Racket are really extensive
- If you want a somewhat different Lisp, Clojure has some fairly unique syntax for a Lisp.
- If you’re interested in macros and meta-programming, they’re basically all good options! But if you want to build new languages, Racket in particular is great

Of course, if you have the time I would recommend you trying out a couple!
Also, don’t be afraid of the parentheses! I know I was, which is why I put off learning Lisp for quite some time.
You’ll quickly get used to them though and maybe you’ll even come to appreciate them, like I did.
In fact, I now love Lisp languages, with the minimal syntax, easy semantics whilst still being very expressive.


