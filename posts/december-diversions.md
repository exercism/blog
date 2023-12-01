# December Diversions

## Introduction

Hey everyone. Welcome to December. I hope you’re doing well.

We’ve had a super-busy October. We just launched a big improvement to community solutions. We now de-dupe them, so the similar solutions only show once, we’ve added new ordering options, the ability to search by code, and if you check C#, you’ll see we’ve also added the ability to filter by different programming concepts. So you can go searching for solutions that use bit shifting, recursion or anything else you fancy. We’ll be rolling that out to other tracks in the community week.

But for now, let’s focus on #12in23. November was an interesting month, exploring assembly languages but this month we’re going for a very diverse set of languages, specifically **ColdFusion, Groovy, Lua, VimScript and Wren**. As normal, Erik’s going to be talking us through what makes the languages interesting and unique.

## The badges

As always, you can earn the December Diversions badge by completing any 5 exercises in these languages. We also have the Year-Long badge that I know many of you are working towards. For that we have 5 featured exercises for you to complete. Those are:

- **All Your Base**: convert a number, represented as a sequence of digits, to another base.
- **Flatten Array**: take a nested collection and return a single, non-nested collection.
- **Queen Attack**: determine whether two queens on a chess board can attack each other.
- **D&D Character**: randomly generate Dungeons & Dragons characters.
- **Run-Length Encoding**: implement run-length encoding and decoding.

## Overviews

### ColdFusion

- Created in 1995 by Allaire Corporation, who were bought by Macromedia in 2001 and then in turn bought by Adobe in 2005.
- Designed as a rapid web-development platform
- Runs on the Java Virtual Machine (JVM)
- There are two separate syntaxes, which look different but are semantically identical:
- The older, tag-based markup syntax which extends HTML to display dynamic content.
- The newer, ECMAScript-like syntax can be used where the tag-based syntax is used, but also in separate script files. The goal was to move business logic from markup to a separate script file
- CFScript is a general-purpose language running on the JVM, which is how Exercism uses it. In practice, it never really moved far from its web server roots.
- ColdFusion is a paid product, but the Lucee Foundation (a Swiss-based non-profit) is still actively developing their open-source ColdFusion server, whose Lucee Server we use for the Exercism track.
- Still actively being developed
- Used primarily in enterprise software; customers include Apple, Adobe, General Motors and more

### Groovy

- Developed by James Strachan starting in 2003. Project was adopted by Apache in 2015.
- Goal was to develop a dynamically typed language on the JVM (in contrast with Java being statically typed) that could also reduce boilerplate code
- Whilst most Java code is also valid Groovy code, there are many differences (e.g. Groovy allows for dynamic typing and advanced metaprogramming). The language was also influenced a lot by Python and Ruby.
- Used for scripting, build tools (Gradle), CI (Jenkins), web apps (Grails), testing (Spock). A popular 3rd-party add-on for Atlassian tools allows groovy scripting.

### Lua

- Lua was created in 1993 by Roberto Lerusalimschy, Luiz Henrique de Figueiredo, and Waldemar Celes at the Pontifical Catholic University of Rio de Janeiro, in Brazil.
- Name is pronounced LOO-ah, which means Moon in Portuguese, and is a reference to the Sol language it was partly inspired by, which means "Sun" in Portuguese
- Primarily designed for embedding, with a focus on speed, portability, extensibility, and ease-of-use in development.
- Influenced by Modula, CLU, C++, SNOBOL and AWK. Similar to how LISP and Scheme had a single, ubiquitous data-structure mechanism (the list), Lua has that with its table.
- Interpreted via bytecode, usually whilst running, but can be done beforehand.
- Used primarily for scripting purposes, e.g. in games like World of Warcraft, Dota 2 and Crysis or applications like Adobe Lightroom and some FreeBSD system software. Also used a lot to add extensibility, e.g. in Redis, Neovim and Nginx.

### VimScript

- VimScript (also called Vim Script (with a space) or VimL for Vim Language) is the scripting language used in the Vim text editor.
- Derived from ex, the line-oriented visual editor that preceded Vi
- Not a general purpose language, but a specialized one that provides an effective and optimized scripting environment for extending and customizing Vim’s functionality through plugins, configurations, macros, and functions.
- While Vim is primarily written in C, Vimscript allows users to customize and extend Vim through a high-level scripting language.
- Used in, well Vim, but also NeoVim, a fork of Vim

### Wren

- Written in 2016 by Bob Nystrom, the author of the Crafting Interpreters book
- Goals: small, simple, fast.
- Designed to be embedded in other applications. Author found existing options (like Lua and TCL) lacking, and wanted a simple, embeddable language that would feel natural to people with an object-oriented background
- Used in:
  - TIC-80 - a fantasy computer for making, playing and sharing tiny games (similar to PICO8)
  - DOME - a cross-platform framework for making games.
  - luxe - a cross-platform, rapid development game engine for making games.
  - Wren Console - a Wren REPL and CLI written largely in Wren itself by long-time Exercism contributor Josh Goebel, which we use for the Wren track

## And from a programming perspective, how do they differ?

### ColdFusion

- Dynamically typed
- Multi-paradigm, primarily OOP but increasingly functional.

### Groovy

- Usually dynamically typed, but can also be statically typed (and gradually typed)
- Can be both interpreted and compiled (from version 2). It’s often used in scripts for this reason
- Multi-paradigm: primarily object-oriented, but also imperative, functional, declarative

### Lua

- Dynamically typed and usually interpreted, but can be pre-compiled
- Multi-paradigm: procedural, object-oriented (albeit a bit differently), functional and data-driven

### VimScript

- Dynamically typed and interpreted
- Multi-paradigm: imperative, functional and a simple form of object-oriented programming

### Wren

- Dynamically typed, but statically defined; allows the compiler to be very fast.
- Primarily an object-oriented language, but also imperative and a bit of functional programming

## What are the things that make these languages great?

### ColdFusion

- Excellent separation between server management and application creation. The admin console sets up database connections and server monitoring (and anything else), the application creators just need the name of a datasource (a CF object with the necessary methods, pre-connected to appropriate parts of the DBMS), plus write access to a directory for the application files.
- Leverage the power of the JVM and the Java ecosystem, which includes being able to import any Java library and use it within CF

### Groovy

- General purpose: can be used for almost any workload, including apps and websites.
- Running on the JVM, all of its benefits apply: mature, highly performant VM and massive number of libraries available. Interops well with Java
- Alleviates many of the issues people might have with Java, such as checked exceptions,
- null safety, verbosity and lack of advanced metaprogramming
- Modern language: advanced type inference, closures, built-in syntax for regular expressions, auto-generate getters and setters
- Great functional programming support: closures (like Ruby’s blocks), currying (partial application), lazy evaluation, immutability and more

### Lua

- General purpose: used in embedded systems, for prototyping, scripting, game, web and backend development.
- Simple: relatively little syntax, making the language easy to learn. Just a couple of atomic data types and just one built-in composite data type: the table. Memory is garbage collected
- Portable: the interpreter is written in ANSI C, for which a compiler exists for almost any platform

### VimScript

- Simple: lightweight syntax that is easy to learn and use.
- Interoperability: easily access files, shells, & other programs. All the power of external tooling without leaving Vim.
- Expressive: do a lot with a little. Write compact scripts that are highly readable.
- Powerful regex engine: Vimscript’s regex implementation is inspired by that of Emacs Lisp, providing a powerful tool for text manipulation.

### Wren

- Small: the VM is implemented in under 4000 lines of code
- Exemplar: the VM’s implementation is lovingly commented, written in C and not that hard to read. Great way to learn how to build a language. Most of the standard library is implemented in Wren, so you can see how that’s implemented too.
- Familiar: syntax makes it quicker to get up to speed. If you're familiar with Java or C++, you’ll be right at home. Allows method overloading by arity
- Really good documentation: the language and standard library docs are easy to read, extensive and have lots of examples.
- Small but surprisingly complete standard library.

## Standout features

### ColdFusion

- Batteries included: tons of things are built in: work with PDF, ZIP, Excel, XML, JSON, API creation, email, S3 integration, lots of different databases… without installing extra packages. Great for reducing version incompatibilities
- Scalable and secure, great for enterprise software
- Simple, intuitive programming that means novices can get complex, data-driven web pages running very quickly. DreamWeaver integration is excellent.

### Groovy

- Flexible Syntax: dots and parentheses can be omitted, which enables creation of very nice domain specific languages
- Metaprogramming: supports both runtime and compile-time metaprogramming. For example, an @ToString annotation will generate a ToString implementation at compile-time and changing an object’s metaclass at runtime allows one to do monkey-patching.
- Builders: quickly handle and build JSON, XML, HTML via nicely-looking code. Build with Swing for rapid GUI development.
- Traits: Groovy Traits let you compose behaviors and properties in reusable chunks. Similar to ruby mixins.

### Lua

- Embeddable: designed to be easy to embed. Has a relatively simple C API to allow for easy embedding. Size is not an issue: the full reference interpreter is just 247 kB!
- Extendable: the base language is purposefully kept relatively small, but what it does allow for is easy extending of the language. This makes the language simpler to learn, more lightweight to embed and very flexible
- Fast: Lua is often one of the fastest dynamic languages, especially when using the LuaJit interpreter

### VimScript

- Extensibility: Vimscript allows you to extend your editor with new functionality
- Customizable: customize your editor to work just the way you like (Vimscript plugins themselves are primarily written in Vimscript)
- Event-driven: automatic code execution based on certain events or conditions like file opens or buffer saves.
- Use the power of Vim: built-in access to Vim’s features and APIs, allowing scripts to manipulate text, buffers, windows, and more.

### Wren

- Fast: great performance for a dynamic language
- Embeddable: easy to embed in other software. The language creator was a former game developer: wanted to be able to add scripting facilities to games. The C API is quite clean and simple.
- Concurrent: easy concurrency and coroutines with fibers, which are a very lightweight construct (like goroutines or Erlang processes) and they can communicate with easy other

## Which to choose

1. If you want to build web applications, ColdFusion and Groovy are good choices
2. If you are interested in a language that can be embedded, Lua and Wren are the primary options, but Groovy might also be worth a look
3. The same three languages, Lua, Wren and Groovy, also make sense if you’d like to write general-purpose scripts
4. If your working with the JVM, ColdFusion and Groovy are natural choices
5. If you value performance, Lua and Wren are likely your best options
6. If your primary editor is Vim or NeoVim, VimScript is obviously an excellent choice
7. If you are interested in learning about or building a compiler and virtual machine, Wren is perfect for you
8. If you have an object-oriented background, Wren is probably the easiest language to learn
9. If you liked LISP’s single, ubiquitous data-structure design, go try Lua
10. If you want to try out event-driven programming, check out VimScript
