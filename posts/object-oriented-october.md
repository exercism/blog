# Object Oriented October

## Introduction

Hey everyone. I hope you’re doing well. We’ve had a busy month in September. We’ve released loads of new improvements and features to the site, largely around improving mentoring and the flows around that. As a result, we’re now seeing twice as many mentor requests come in as we were this time 4 weeks ago, which is great. If you’ve not tried getting your code reviewed by a mentor, definitely do so - it’s an amazing way to learn. And if you’re looking to help others, there’s lots of requests in the queues waiting for you to help with. You can sign up to be a mentor under the Mentoring link in the Contribute menu! We also did a big database update from MySQL 5.6 to MySQL 8, which I recorded and is available in the Insiders section, so if you’re an Insider and you’ve not watched that yet, do check it out!

Right, onto #12in23. September was an interesting month, exploring concise, terse languages. This month we’re going the other way, and looking at some much bigger beasts. We’ve focusing on Object Oriented Languages and specifically C#, Crystal, Java, Pharo, Ruby and PowerShell. We’ve already discussed both Pharo and Java - in May and August respectively - so we won’t cover those again in this video, but do check out the previous months’ videos if you’re interested in the introductions to those languages. But in this video, we’re going to be exploring C#, Crystal, Ruby and Powershell, and as normal Erik’s going to be talking us through what makes the languages interesting and unique.

## The badges

As always, you can earn the Object-Oriented October badge by completing any 5 exercises in these languages. We also have the Year-Long badge that I know many of you are working towards. For that we have 5 featured exercises for you to complete, all of which lend themselves well to being solved in an OOP sort of way. Those are:

- **Binary Search Tree**: insert and search for numbers in a binary tree
- **Circular Buffer**: implement an end-to-end connected data structure
- **Clock**: implement a clock that handles times without dates
- **Matrix**: return the rows and columns of a matrix represented as a string
- **Simple Cipher**: implement a substitution cipher

## Overviews

### C#
- Developed by Anders Hejlsberg at Microsoft in 2000
- The language and virtual machine have official specifications. Became an official ECMA standard in 2002 and an ISO standard in 2003
- The compiler, .NET Framework (standard library) and Visual Studio (editor) were all initially closed-source, but the compiler and .NET Framework were open-sourced in 2014
- Whilst sharing a lot of syntax with Java (which had released a couple of years prior), C# was not a one-to-one copy of Java (e.g. support for properties, value types and no checked exceptions)
- Compiles to bytecode, with compilation to machine code supported since .NET 7 (still being improved)
- Used in vast amounts of software, from websites to embedded systems, and from apps (Xamarin) to games (Unity)

### Crystal
- Crystal was developed by Ary Borenszweig (who has an account on Exercism), Juan Wajnerman, Brian Cardiff (originally named Joy, but renamed to Crystal 3 days later :))
- Designed to have the elegance and productivity of Ruby but with the speed, efficiency, and type safety of a modern compiled language.
- Open-source language developed by the Manas organization.
- Version 1.0 was released in 2021.
- Compiles to machine code using LLVM (like Rust)
- The compiler was initially written in Ruby but was later converted to a self-hosted version
- Used by the truck company Nikola, Manas and others, mostly for websites, but also cloud services, command-line applications and scripts

### PowerShell
- Built by a team led by Jeffrey Snover at Microsoft and originally released in 2006.
- Development was triggered by Intel, which wanted to move their KornShell scripts from Sun RISC to another platform, to help with development of their CPUs. Ultimately, Intel chose a different platform, but Microsoft continued working on their new shell: PowerShell, as it offered the possibility to improve Windows system administration (which was not particularly great at the time, often requiring GUIs)
- Syntax was inspired by KornShell, but also PHP, Perl, and others
- First version only ran on .NET Framework, which meant that it only ran on Windows. But PowerShell 6.0 (released in 2018) ran on .NET Core, which is cross-platform and open-source.
- Primarily used for system administration, but also used to provide CLI utilities or wrappers around other tools. We’ve used it tons to bulk work with Exercism repos

### Ruby
- Developed and by Yukihiro Matsumoto (aka Matz) and first released in 1995
- Matz wanted to work with a proper object-oriented scripting language, but didn’t like existing options (such as Perl and Python) and thus built a new language: Ruby
- Matz describes ruby as a simple Lisp language at its core, with an object system like that of Smalltalk, blocks inspired by higher-order functions, and practical utility like that of Perl.
- Usually interpreted, but can also be just-in-time compiled to machine code
- Besides the official interpreter, there are alternative implementations, such as JRuby (runs on the JVM), Rubinius (uses LLVM) and YJIT, a just-in-time compiler that is shipped as part of the official installation package
- Mostly used in websites (using Ruby on Rails), e.g. GitHub, Stripe, Shopify and many more (including Exercism and the Exercism forum!). Ruby is also used for automation purposes

## And from a programming perspective, how do they differ?

They are all object-oriented languages, although they don’t all implement that in the same way (e.g. Crystal and Ruby use Smalltalk’s message-sending model for invoking methods).

### C#
- Strong and statically typed
- Also supports imperative and declarative paradigms and becoming more and more functional

### Crystal
- Strong and statically typed (unlike Ruby)
- Also supports functional and imperative programming

### PowerShell
- Strongly-typed
- Also supports imperative,functional programming and pipeline-based programming.

### Ruby
- Dynamically typed
- Also supports functional and imperative programming

With that said, all these languages are foremost object-oriented languages.

## What are the things that make these languages great?

### C#
- Runs (almost) everywhere, including apps via Xamarin. Originally only ran on Windows, which spawned Mono, a free and open-source implementation of a C# compiler and runtime that was cross-platform. In 2015, .NET Core was introduced, which was fully cross-platform and open-source.
- General purpose: can be used for almost any workload, including apps, websites and games
- Expressive: you can do much with relatively little C# code. LINQ especially is a great productivity boost and a lot of fun to work with
- Excellent tooling, both for IDEs and other tools like build systems. Whilst Visual Studio is Windows-only, JetBrains Rider and VS Code are cross-platform
- The .NET Compiler Platform (often referred to as Roslyn) is a fantastic way to parse/transform/generate C# code (we use it extensively in the C# test runner/analyzer/representer)
- Documentation is extensive, detailed and well written
- Large community: many resources available, including blogs, forums, and more

### Crystal
- Elegant and readable syntax, making Crystal code easy to read and write
- Expressive. Like Ruby, Crystal is very expressive, where you can do a lot with little code. This is in part due to the excellent and extensive standard library.
- Fast. Static typing allows for compiling to efficient machine code using LLVM, with simple memory management through a garbage collector.
- Awesome object-oriented implementation. Everything is an object, including classes and primitive types like numbers and booleans
- Batteries included, large standard library, built-in formatter, template engine, testing framework and more
- Interop. Easy interop with C libraries
- Cross-platform: runs on linux, macOS and Windows, although Windows is not yet a first-class citizen

### PowerShell
- Powerful: Powershell is a powerful tool for administrators. It integrates well with many other systems, such as the Windows OS (components, services and settings), other Microsoft products like Exchange, SharePoint, Azure, etc. It can also interact with many other technologies like REST APIs, databases, web services and more.
- Availability: Powershell comes pre-installed on every modern Windows OS and can be installed on any system that runs .NET (which includes macOS, Linux and many Unix systems)
- Security: PowerShell includes features for securing scripts and restricting their execution based on signed scripts and execution policies. This is crucial for ensuring the safety of your automation processes.
- GUI: You can combine it with other frameworks like Windows Forms or Windows Presentation Foundation to design and build graphical interfaces for your PowerShell scripts to make it more user friendly.
- Pipeline: Similar to Bash on unix systems, Powershell allows you to chain cmdlets together to perform complex operations and tasks by passing output of one cmdlet as input to another

### Ruby
- Elegant and readable syntax, making Ruby code easy to read and write
- Expressive. Ruby is a very expressive language, where you can do a lot with little code. This is in part due to the excellent and extensive standard library
- Huge ecosystem, with a massive number of available libraries (gems)
- Awesome object-oriented implementation. Everything is an object, including classes and primitive types like numbers and booleans.
- Pragmatic. Ruby and most of its libraries are very pragmatic, focusing on solving real-world problems.
- Interop. Easy interop with C libraries, which is often used when performance is particularly important. As an example, the Nokogiri gem allows working with XML in a highly performant way by wrapping C libraries to do the heavy lifting
- Lots of innovation is happening. E.g. Stripe has built Sorbet, a type checker for Ruby, , Shopify has developed YJIT, a Just-In-Time Compiler for Ruby (included in Ruby 3.1+) and WASM support is being worked on

## Standout features

### C#
- Great performance, especially for a managed language. Both the language and runtime have tons of features to improve performance, e.g. the Span<T> type and access to CPU intrinsics (like AVX instructions). The CLR is a mature, stable and highly performant virtual machine that is continually being improved
- Huge ecosystem, with a massive number of available libraries. Those libraries are, like C#, mature, stable and full-featured
- Modern and evolving: the language and runtime are still evolving, with very regular updates to the language to make it more modern. Examples of this are:
- async/await for easy concurrency
- span<T> for efficient memory usage
- Nullable reference types (fixing the billion-dollar mistake)
- The runtime is also regularly updated, e.g. .NET AOT to compile directly to machine code
- Less alternatives than a lot of other languages/ecosystems. For most purposes, you can get away with using the default, Microsoft-provided solutions, which often includes the IDE as well. One could also argue that this is a downside as well, but it can be great, especially when starting out with a language

### Crystal
- Best of both worlds. The combination of global type inference and union types makes Crystal feel like a dynamically typed language with often little typing needed to be specified, but still having the performance and additional security guarantees (including nil checking at compile time) of a statically typed language
- Metaprogramming. Instead of Ruby’s dynamic, runtime metaprogramming, Crystal has macros, which run at compile time. Macros work on AST nodes and produce code. They’re quite easy to define and use. Embedded Crystal (ECR) is a built-in template engine that uses macros to embed Crystal code in other text
- Great concurrency. Concurrency is easy to use with a Go-like concurrency model that uses fibers (lightweight execution unit) that communicate via channels
- Productive and fun. Ruby is famously designed for productivity and developer happiness, with elegant, readable syntax and great ergonomics. As Crystal’s syntax and design are very similar to Ruby, this also applies to Crystal (fun fact: quite a bit of Ruby code is valid Crystal code).

### PowerShell

- Cmdlets: PowerShell uses cmdlets (pronounced “command-lets”) as its building blocks. They are small, task-oriented commands that wrap existing functionality, providing a consistent (e.g. Get-Help for showing the help of any cmdlet), administrator-friendly interface for system administrators. There are cmdlets for a wide variety of “backends”, such as all .NET classes, Windows Management Instrumentation, Azure, and many more. Cmdlets can be defined in any .NET language and are defined in a very declarative way, with parameters, their validation, requirements (required true/false), alternative (switch) names etc easily defined.
- Object-Oriented: Nearly everything in Powershell is an object with many different properties. Files, processes, register keys, and even simple data types like string and number are all treated as objects, this approach simplifies how you work and interact with different types of data and services. Will be very familiar to anyone who was worked with .NET
- Remote Management: It supports remote management of Windows servers and systems, and even cloud resources across Azure, AWS and GCP which is essential for managing large-scale automation and deployments .
- Extensible: It has a great built in module system, along with allowing you to create custom cmdlets, functions and modules, and working with other programming languages and libraries to further extend its capabilities as needed.

### Ruby

- Productive and fun. Ruby is famously designed for productivity and developer happiness. Whilst hard to quantify, the enthusiasm of people that have used Ruby speaks volumes
- Metaprogramming. Ruby is highly dynamic and allows for runtime metaprogramming. Whether it’s monkey-patching existing classes, dynamically adding or calling methods, Ruby has you covered
- Ruby on Rails is a fantastic, full-featured framework for building websites. Out of the box, it contains templating, caching, ActiveRecord (a way of interacting with a database via objects), migrations, scaffolding, WebSockets, and much more.

## Which to choose

- If you’re familiar with object-oriented programming but want to see a different take on it, try Pharo
- If you know Java or C# but haven’t touched them for a while, give them another go. Both languages have evolved a lot, so check out some of those shiny new features!
- C# and Java (and Ruby to a lesser extent) are also great options if you are looking for work, as they are some of the most requested languages by employers
- If you know Ruby, try out Crystal to see what a statically typed Ruby would look and feel like
- If you like dynamic languages but also want great performance, go checkout Crystal
- If you know Bash or Windows batch files, try out PowerShell for a different, object-oriented take on shell scripting
- If you are into scripting languages in general, Ruby, Crystal and PowerShell are all good options
- Pharo, Crystal and Ruby are great if you want to do some meta-programming (C# is getting some meta-programming features too)
- If you want to experience what it is like to program in a language that isn’t backed by text files, try Pharo and its unique and powerful IDE
- If you’re into building websites, Ruby with its Ruby on Rails framework is worth trying

