# Blog post

Welcome to our second themed month - Mechanical March. In this month we’re focussing on system languages, those that compile down to machine code.

This is part post, part-transcript of the Mechanical March video. 
I’ll give you a quick intro to the month and then we’ll look a little at system languages, their evolution through history, the pros/cons of compiling to machine code, and a quick look at each of the featured languages.
I’m joined again by Erik, who will do most of the talking in the second half. But I’ll get us started with some of the practical information.

So firstly, the featured languages for this month. They are C, C++, D, Go, Nim, Rust, V and Zig. To get the Mechanical March badge you need to complete five exercises in one of those languages. Our Go track has one of the best syllabuses on Exercism, so I really recommend you try that out. We’re also big fans of Nim here at Exercism as it’s a relatively simple language to get started with and very easy to write, so I’d definitely recommend trying that out too.

We also have five featured exercises to try:
- Linked-list or simple-linked-list (depending on the language): allocating/freeing memory, pointers
- secret-handshake: bitwise operations
- pangram: for loops, strings and characters
- sieve: arrays, for loops
- binary-search: arrays, loops

There’s a new badge which I announced in the update video I did a few days ago, which is for completing the five featured exercises in the thematic languages. So to get that badge you’ll need to complete all of those languages in a system language sometime during the year.

We’ve also got lots of fun things bubbling away - interviews with a couple of people from the Go Core team, hopefully from Rust and some of the other languages too. We’ll also be having lots of live streaming throughout the month. And some Mechanical March swag landing soon as well!

So, let’s dig into the technical side a little more. 

### What are these languages used for? 

Well we use them across Exercism. Our CLI is written in Go, our internal track management tool called configlet is written in Nim, and the key library that counts the lines of code in your solutions is written in Rust. Erik, why did we choose those languages for those bits of tooling?

CLI:
- I think we used Go because that is what Katrina was most familiar with. 
- Go is great for these small-ish command-line tools. 
- Go code is relatively straightforward, making contributions easier
- Go binaries are easily deployable due it requiring no runtime
- Go does cross-compilation well

Nim
- Nim has most of the same perks as Go
- We didn’t have many people knowing Go that could maintain the CLI, we switched to Nim

### What other sorts of places would you expect to find these languages used?

- Anywhere where performance is important (drivers, games, operating systems, build systems/compilers)
- Anywhere where resources are limited (e.g. embedded software)
- Anything that needs to be highly portable, as in: run on many different platforms

### What is machine code?

So as I said earlier, these languages in Mechanical March are distinguished by compiling to machine code. Can you explain a little what machine code is, and what in contrast bytecode is?

- Machine code is code that can directly run on the machine. 
- Bytecode by contrast requires some other code to interpret/compile the bytecode to machine code. Therefore, bytecode requires an intermediate step before it can be executed.

### What are the pros and cons of machine code over byte code?

Pros:
- Faster startup (no JIT compilation step)
- Smaller memory footprint (no runtime being loaded, no bytecode in memory, great for embedded systems)
- Target machine doesn’t need a runtime to be installed (important to keep docker containers small)

Cons:
- Not portable. Bytecode is portable, but compiled machine is specific to a platform
- Can’t do advanced optimizations like profile-guided optimization (determining best way to compile the (byte)code after having ran it for a while)

Note: hybrid approaches are possible, where the language compiles to bytecode and then uses a different tool to compile that bytecode to machine code.

### The evolution of system programming 

Ok. So let’s look a little at the evolution of some of the languages this month. Firstly, let’s start with where it back with C and how C++ evolved from there. Tell us a little about those languages

C is a very low-level language. It feels like you’re just slightly above machine code. This makes it very powerful and highly optimizable, but also somewhat bug prone (e.g. null pointer exceptions and buffer overflows). 
Memory management is all manual and thus the responsibility of the programmer, potentially leading to bugs and/or memory leaks.
C++ is like C but with object-oriented programming support. It is still fairly low level and requires you to do manual memory management. Both C and C++ allow you to write inline assembly (ASM)!

### And what about the newer system languages. How have they evolved?

All modern system programming languages support automatic memory management, either via reference counting, a garbage collector or some other mechanism.

Early system programming languages all support null pointers (called by Tony Hoare, his “billion-dollar-mistake”). These are infamous for leading to runtime errors and vulnerabilities.
Many modern languages do away with null, or at least require effort to use it.

Another change is a move from mutable values being the default, to immutable values by default. E.g. Rust and Vlang both have immutable values by default, requiring one to opt into mutability.

All the newer languages have support for interop with C (or C++), as so much code has been written in those languages.

Another interesting thing is that some of the newer languages don’t directly compile to machine code, but use other tools to do so. E.g. Rust and Zig use LLVM, whereas Nim allows one to use a wide variety of compilers. This is known as transpiling.

### And what about things like macros and metaprogramming?

There is an interesting split regarding macros/metaprogramming. Macros in C/C++ are powerful, but have a somewhat dubious reputation of being hard to work with. Rust, Nim and D all offer powerful metaprogramming, but do so in a much nicer way. Conversely, VLang and Zig both explicitly mention no macros being a feature of their language, and Go has a different approach with go generate.

### system languages have the reputation of being pretty low level. Is that still fair?

The newer languages all work at higher levels of abstraction than C/C++. 
E.g. Rust, D and Nim also allow for a very functional way of writing code. 
Nim and D even have the concept of “pure” functions.

## Introduction to the languages of the month

So it’d be good to look at each of the languages in turn. All the languages have similarities - they’re all strong and statically typed. But lets look at how they vary. Shall we start with C? 

### C

- Developed by Dennis Ritchie
- One of the oldest, and probably the most used languages in the world
- Tons of software is written in C, like Unix and Linux
- Highly influential (think of: C-like languages being a thing) 
- Manual memory management
- Highly performant (close to “the metal”)
- Runs anywhere
- Perfect for embedded systems
- Fairly small language

### C++

- Developed by Bjarne Stroustrup
- Successor to C, but with added object-orientation (C with classes)
- Helped popularize object-oriented programming
- More high-level language features than C
- Supports generic programming via templates
- Add module support via namespaces
- Many game (engines) are written in C++, and large parts of Windows
- Manual memory management
- Still evolving with new features being added regularly (big spec)

### D

- Developed by Walter Bright, and later joined by Andrei Alexandrescu
- Originally considered a re-engineered C++ (learning from its “mistakes”), it takes inspiration from many other languages
- Multi-paradigm, supporting imperative/object oriented/functional programming
- Easy interop with C/C++
- Uniform Function Call Syntax
- Compile Time Function Evaluation (e.g. generating Regex state machine at compile time)
- Supports functional programming and “pure” functions
- Many safety features
- Memory safety via @safe
- Contracts (pre/post conditions, invariants)
- Pure functions
- Focus on unit tests, with tests next to source code it is testing (required an exception at the Exercism website :))
- Unicode

### Rust

- Developed by Mozilla Research employee Graydon Hoare, then officially adopted by Mozilla and now part of Rust Foundation
- Multi-paradigm, supporting OO (but opinionated, e.g. no inheritance), imperative and functional programming (Option/Result types, pattern matching)
- Many new tools written in Rust (e.g. SWC, but also Gleam, and second supported language in Linux kernel, we depend on it for the lines of code counter)
- Focus on reliability and performance
- Built on LLVM
- Most loved language in StackOverflow survey for last 7 years
- Fast, partly due to minimal core and standard library
- Safe, both memory-safety and thread-safety via ownership and lifetimes, immutable by default
- Powerful type system, catching many bugs at compile time (especially memory-related). Compiler outputs really helpful errors
- All batteries included: compiler, build tool, formatter, package manager, IDE integrations
- Lovely documentation (there is even a massive document on how the compiler works)
- Portable: compiles to single, static binary and does not require runtime to be installed
- Easy interop with C code
- Zero-cost abstractions
- Fearless concurrency
- Macros

### Nim

- Developed by Andreas Rumpf (originally named Nimrod)
- Syntax inspired by Python
- Multi-paradigm
- Used at Exercism in configlet
- Great performance: zero overhead iterators, preference for stack allocation of value-based types
- Modern, expressive type system: type inference, tuples, generics, sum types, async/await
- Garbage collection but with deterministic memory management support (multiple memory management options)
- Compile time execution of code
- Uniform call syntax
- Macros: easy to extend the language
- Effects system: encoding side effects in the type system

### Go

- Developed by Robert Griesemer, Rob Pike, and Ken Thompson at Google
- Mostly imperative/procedural, supporting an object-oriented like approach (but without inheritance)
- Used in big projects like Docker, Kubernetes. Also great for backends and CLIs (e.g. esbuild)
- Aims to be simple enough to hold in one’s head (little syntax)
- Memory safety via garbage collector
- Fast: fast compilation, fast testing and fast runtime. Built-in support for writing benchmarks!
- Opinionated: lot of effort to influence style of Go code: little syntax, formatting code via go fmt, tooling to check code for idiomatic usage, erroring on things that are warnings in other languages (e.g. unused variables), documentation listing Go idioms to use
- Lightweight type system that makes Go very flexible (supports type inference)
- Portable: compiles to single, static binary and does not require runtime to be installed. Easy cross-compilationConcurrency via goroutines (lightweight) and communication via channels
- Structural typing via interfaces (akin to duck typing, but statically checked)
- Error handling: language encourages to check for and deal with errors

### VLang

- Developed by Alexander Medvednikov and Delyan Angelov
- Inspired by Go: 
- Same “only one way to do things” strategy
- Same “minimal syntax” strategy
- Coroutines
- Different from Go:
- No nil/null, but uses result type
- Immutable by default
- Sum types (functional)
- String interpolation
- Smaller runtime/binaries
- Pattern matching
- Working to make GC optional (autofree)
- Zero cost C interop
- Generate documentation from code
- Fast compiler that uses little memory

### Zig
- Developed by Andrew Kelley
- Fairly little syntax (500 line PEG grammar file)
- Compile time code execution and reflection
- Aims to be “obvious”, no hidden control flow or allocations or macros/metaprogramming
- Manual memory allocation
- Supports different allocators
- Standard library functions that allocate have an allocator parameter
- Test framework can detect memory leaks
- Safety:
- Errors are values and must be handled
- No null, uses optional type
- Tests can be written in same file as source (like D)
- Uses LLVM as backend
- Can compile C/C++ code
- Easy C interop
- Easy cross-compilation

## Conclusion

We’re going to leave this here as I imagine everyone’s brains are pretty full at this stage. 

Hopefully that’s been a useful and fun introduction to the featured languages this month. I hope you have loads of fun exploring these languages. Erik and I would both love to hear which ones you choose and how you find them, so please do post in the comments or on the forum! 

Thanks for watching!

