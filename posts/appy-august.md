# Appy August

## Introduction

Hello. Welcome. Hope you're all doing well.
I hope you've had fun playing exploring some old and influential languages during Jurasic July.
Now onto Month 8 of 2023, and our 7th themed month - Appy August.

### What do we mean by apps?

Well it can mean a number of things:

- Web applications, the bread and butter of a lot of our days now
- Native apps like those that run on your phone or tablet
- Desktop apps that directly run on your Windows, Mac or Linux operating system
- Domain specific applications
- Business applications
- And more!

### So what are the languages?

We're looking at a whopping 14 languages: ABAP, CoffeeScript, Dart, Delphi, Elm, Java, JavaScript, Kotlin, Objective-C, PHP, PureScript, ReasonML, Swift and TypeScript.

## The badges

Get the badge by completing 5 exercises in one of those this month.
And for the year-long badge, you need to complete:

- **Anagram**: given a word and a list of possible anagrams, find its anagrams
- **Phone Number**: clean-up a phone number
- **Triangle**: classify a triangle
- **RNA Transcription**: transform a DNA sequence into its RNA complement
- **Scrabble Score**: given a word, determine its scrabble score

## Overviews

### ABAP

- Developed by SAP SE in the 1980s and its design goal becomes clear when we check what the acronym stood for: Allgemeiner Berichts-Aufbereitungs-Prozessor, which is German for "general report preparation processor”. Later on, ABAP changed to be more generally applicable, and the acronym was updated to Advanced Business Application Programming to reflect that
- Strong and statically typed language
- Multi-paradigm: supports imperative and object-oriented programming
- Compiled to bytecode. Interestingly, the source code is stored inside the database
- All code runs in the context of an SAP system, which consists of a relational database and one or more application servers
- Proprietary technology and closed-source. although one of our maintainers has built a fantastic open-source re-implementation
- Used in applications for business applications, like finance, materials management, accounting and management. Has customers all over the world, with many big names like Apple, Amazon and Walmart

#### Why it's great

- Constantly evolving, with new features being added regularly
- Reliable: stable functionality with decades of experience behind it
- Large standard library

#### Standout features

- Seamless integration with the SAP system and database, but also with many other systems
- ABAP Dictionary contains all metadata on the data in the SAP system, which includes tables, views and structures. The types in this dictionary can be used to statically type variables, even when the type is a table
- ABAP Workbench is part of the ABAP system and contains a suite of tools for editing programs. Includes designing screens

### CoffeeScript

- The language received its first commits back in 2009 by Jeremy Ashkenas, the first commit message was labeled “initial commit of the mystery language.”
- Dynamically typed and multi-paradigm (object-oriented,imperative, functional, prototypical)
- Compiles to JavaScript (known as _transpiling_).  The golden rule of CoffeeScript is: “It's just JavaScript.” One of the first successful “transpile to JS” languages
- Became popular because CoffeeScript did not have some of the issues people doing JS struggled with at that time (like the “this” binding working differently, or classes not being supported). Was included in Ruby on Rails from version 3.1.
- In 2017 the language received its 2.0 version which aimed to bring it up par with the latest JavaScript standard. The language receives an update about once a year.
- The language compiler was originally written in Ruby but replaced in 2010 by a self-hosting compiler written in CoffeeScript (the compiler does not depend on NodeJS and can run directly in the browser)
- CoffeeScript was influential in that it inspired JavaScript to adopt certain features (lambda arrow syntax, clases)
- Used to be used by Dropbox and in Rails

#### Why it's great

- Clean, concise syntax inspired by Python, Ruby and Haskell. Less verbose than JavaScript, removing many parentheses and curly braces, partially due to using significant indentation (whitespace is important)
- Simplified semantics, e.g. no confusion around let, var, const as they don't exist and == is transpiled to === (strict equality) and function bindings prevent common “this” mistakes
- Expression-based, which means that you can assign the result of an if expression to a variable
- Lots of syntactic sugar, e.g. use @ instead of this, yes/on can be used instead of true, // for floor division, @ instead of this and much more

#### Standout features

- Compiles to clean, human-readable JavaScript with a one-to-one correspondence between source and generated code.
- Great interop with JavaScript: you can use code written in JS from CoffeeScript easily (and vice versa). Use any JS library written
- Adds features that are or were missing in JavaScript: list comprehensions, string interpolation, existential operator (?), chained comparisons
- Small language, compiler is 500-ish kb (100kb zipped)

### Dart

- Designed by Lars Bak and Kasper Lund at Google
- First release in 2011
- Goal was to create a fast, productive language particularly well-suited to building UIs
- Statically typed
- Multi-paradigm: primarily object-oriented, but also functional and imperative
- Can be interpreted and just-in-time compiled
- Primarily used to build apps, but can also be used to build backends

#### Why it's great

- Easy to learn due to familiar syntax
- Modern type system: type inference, pattern matching, async/await
- Excellent documentation
- Safety via sound null-safety system: no more null pointer exceptions
- Good tooling, support in various IDE's. Optimized for short feedback loop, e.g. via fast hot reload
- Growing ecosystem with many libraries available

#### Standout features

- Can compile to JS, native, but also to Swift and Kotlin, great for mobile apps.
- Flutter library can be used to quickly build mobile, web, desktop or embedded apps. Write once, run on different platforms
- Excellent concurrency support, with async/await, isolates (lightweight concurrency running constructs), futures and more

### Delphi

- Delphi was developed by Borland and released in 1995.
- It is an Object Pascal programming language and was developed by Anders Hejlsberg, one of C#'s lead architects
- Strong and statically typed
- Compiles to native code
- Multi-paradigm: mostly object-oriented, but also imperative, declarative and event-driven
- Used in business applications, GUIs and schools (to teach programming)

#### Why it's great

- Easy to learn. Object Pascal combines the simplicity and clarity of Pascal with object-oriented programming features, making it easier to write and maintain code
- Integrated Development Environment (IDE): The Delphi IDE offers a user-friendly and feature-rich environment that streamlines the development process. It provides code navigation, debugging tools, code completion, and other productivity features that make development more efficient.
- Stability: around since the early 1990s with a history of being a reliable and stable development tool and language, including strong backwards compatibility. Code written in earlier versions of Delphi can still be compiled and run in newer versions with minimal adjustments.
- Cross-platform support: Delphi has expanded its capabilities beyond Windows and offers cross-platform development support, allowing developers to target multiple operating systems like macOS, iOS, Android, and more. This enables the creation of applications for a broader audience and increases the reach of projects.
- Strong community and support: Delphi has a dedicated and active community of developers who contribute libraries, tools, and resources to the ecosystem.

#### Standout features

- High-performance executables: Delphi applications are known for their speed and performance. The Delphi compiler produces highly optimized native executables, which can be critical for certain types of applications, such as those that require real-time processing or heavy computational tasks.
- Rapid Application Development (RAD) Environment: visual drag-and-drop design tools allow developers to create user interfaces and connect them to functionality with minimal effort, speeding up the development process.
- Component-based architecture: relies on a component-based architecture, where reusable components are built to build applications. Makes it easier to reuse code and reduces development time.
- Event Handling: Delphi uses a built-in event model, allowing developers to respond to user actions and other events easily. Event handling simplifies the process of capturing user input or system events and responding appropriately.
- Database Connectivity: Delphi provides native database access components that allow seamless integration with various database systems. This built-in support simplifies database-driven application development.

### Elm

- The language was created by Evan Czaplicki for his senior thesis and released in 2012
- Initially tackled the subject of Functional Reactive Programming (FRP) for GUIs (FRP with signals), but in 2017 FRP was dropped in favor of TEA (The Elm Architecture)
- Statically and strongly typed, functional language
- Syntax inspired by Haskell
- Open-source language, but very opinionated, and the style of development involves long periods of deep work for Evan before making things public. So PRs may not be merged for very long, and the project may appear stale, but it's just Evan's work style.
- Used in websites, e.g. NoRedInk, Vendr, Rakuten, Brilliant

#### Why it's great

- It's a very small language, one of the easiest to learn for the ML family of statically typed functional languages. This almost makes it great to teach functional programming.
- Compiler errors are the nicest and most helpful you'll find out there.
- Stable language: the last release is from 2019
- Packages in the ecosystem are few but high quality.
- A powerful linting ecosystem with elm-review (powers the Exercism Elm track's analyzer).

#### Standout features

- The Elm Architecture (TEA) underlines all Elm apps, so it's very easy to review unknown Elm applications.
- No runtime exceptions! Except for just a couple of things.
- No breaking when updating dependencies, semantic versioning is enforced by the compiler.
- When it compiles, it works (except logic errors). And when you get used to it, it's very hard to go back to other languages.
  - Matthew Griffith's “elm-ui” enables “when it compiles it works” for style and layout, you don't need CSS.
- Full-stack web-apps: Lamdera is a spin off using Elm for full-stack web apps with zero glue between frontend and backend.

### Java

- Developed by James Gosling at Sun Microsystems and released in 1995.
- Five original goals:
  - Simple, object-oriented, and familiar.
  - Robust and secure.
  - Architecture-neutral and portable.
  - High performance.
  - Interpreted, threaded, and dynamic.
- Strong and statically typed
- Compiled to bytecode (native code is being worked on)
- Multi-paradigm: imperative, object-oriented and functional
- The language and virtual machine have official specifications, and thus also multiple implementations (e.g OpenJDK JVM and Oracle's Hotspot VM)
- Used in vast amounts of software, from websites to embedded systems, and from apps to databases

#### Why it's great

- Runs (almost) everywhere (as the Java updater will happily remind you ;))
- General purpose: can be used for almost any workload, including apps, websites and embedded systems
- Interoperability with other JVM languages, like Kotlin, Groovy, Scala and Clojure
- Excellent tooling, both for IDEs as other tools like build systems

#### Standout features

- JVM is a mature, stable and highly performant virtual machine that is continually being improved
- Huge ecosystem, with a massive number of available libraries. Those libraries are, like Java, mature, stable and full-featured
- Evolving: the language and runtime are still evolving, with regular updates to the language to make it more modern and address complaints people have (such as reduction of boilerplate and verbosity). For the runtime, new projects are regularly started to further evolve the runtime (e.g. project loom for lightweight concurrency constructs and native compilation via GraalVM)

### JavaScript

- Brendan Eich was hired by Netscape in 1995, to provide a language to make web pages dynamic. The first prototype was famously created in 10 days
- Standardized as ECMAScript in 1997
- Dynamic and weakly typed
- Used to be solely interpreted, but today often just-in-time compiled
- Multi-paradigm: prototypical (quite rare), but also object-oriented, imperative and functional
- Hugely influential in making the web the success it is today. E.g. AJAX was very helpful in adding interactivity. De facto standard for web development, as it is the only programming language with support built into the browser
- Probably the most used language nowadays
- Used for backends, frontend, scripts and command line tools

#### Why it's great

- General purpose: can be used for many workloads: backend, frontend, scripts, command line tools. Many tools that are used for the web are written in JavaScript (and run on nodejs)
- Runtimes (like V8) are heavily optimized and can be very performant, even though the language is highly dynamic
- Relatively small language, which makes it relatively easy to learn. Being able to run it a browser makes it especially great, as you can get visual feedback whilst learning
- Spec is frequently updated to introduce new features, like async/await, string interpolation. Also a lot of innovation around tooling, with newer tools like deno, esbuild and bun.js being developed to help work with JavaScript codebases
- JSON support is top notch, evidence by the fact that JSON stands for JavaScript Object Notation
- Designed to be good for event-driven, non-blocking code

#### Standout features

- Huge ecosystem. Enormous amount of libraries are available (2.1 million package in September 2022), but also many other languages that target JavaScript
- Runs on most platforms and hardware, from Windows to Apple, from Raspberry Pi's to phones, from web servers to serverless platforms. Web browsers have native support built-in, so no need to install a runtime.
- Ideal for web development, with many frameworks to choose from (React, Vue, Angular) as well as lots of tools to help build web applications (e.g. eslint, parcel)
- Can be used isomorphic, which means that the same language (and code base) can be used for both the backend and the frontend. This makes it easier to maintain and allows for code reuse between frontend and backend
- Huge popularity means: lots of resources to learn from (videos, blogs, courses), vast community to interact with

### Kotlin

- Developed by JetBrains in 2010, famous for their IDEs (e.g. IntelliJ, CLion, GoLand and Rider)
- Most of JetBrains' products were written in Java, but they wanted a JVM language that would reduce boilerplate code, speedup development and support some features they were missing. Scala had these features, but was found to be too slow to compile. Thus Project Kotlin was started.
- Strong and statically typed
- Multi-paradigm: imperative, object-oriented, functional, declarative
- By default, compiles to JVM bytecode, but can also compile to JS and native (useful for platforms on which virtual machines are not possible or desirable, like iOS devices)
- Was marked by Google as the preferred language to write Android apps in, in 2019
- Used to build websites, apps (mostly Android) and even entire IDEs (the aforementioned IDEs)

#### Why it's great

- General purpose: can be used for almost any workload, including apps and websites. Google deemed Kotlin the preferred language to develop Android apps in 2019
- Running on the JVM, all of its benefits apply: mature, highly performant VM and massive number of libraries available
- Alleviates many of the issues people might have with Java, such as checked exceptions, null safety and verbosity
- Modern language: advanced type inference, expression-based, immutability, pattern matching, coroutines, channels
- Excellent tooling (is to be expected when the IDE itself is written in the language :)

#### Standout features

- Productive: Kotlin adopts the best parts of other languages, molding them into one consistent, productive language, and in some cases even further improving on the original (e.g. with local extension methods)
- Coroutines: whilst in many languages, async/await is baked into the language, in Kotlin that is implemented as a library using the language's coroutines feature. Coroutines are a way to deal with suspending functions, which provide a safer and less error-prone abstraction for asynchronous operations than futures and promises.
- Great concurrency: async/await, channels, immutability all help with getting excellent concurrency
- Compose multiplatform allows building shared UIs from the same code base using a declarative syntax

### Objective-C

- Originally developed by Brad Cox and Tom Love in the early 1980s, it was selected by NeXT for its NeXTSTEP operating system. Due to Apple macOS's direct lineage from NeXTSTEP, it became the language of choice for Apple software
- Designed to combine SmallTalk's object-oriented ideas with C, using message passing as the core object-oriented construct
- Superset of C, so any C code is valid objective-c code and both can be combined in the same code base
- Static and dynamic typing
- Compiled
- Standard language to write macOS and iOS applications until the arrival of Swift in 2014
- Used for macOS and iOS apps

#### Why it's great

- Blend of C with object-oriented features can be really powerful
- Thin runtime, making it resource efficient
- Lightweight class syntax
- Fast enumeration allows for easier for loops than C
- Strong backwards compatibility

#### Standout features

- Supports Automatic Reference Counting (ARC), which will automatically release memory when an object is no longer being referenced, making memory management easier
- Dynamic runtime allows for method swizzling (dynamically change the behavior of a selector (like monkey patching)), reflection and message forwarding (great for observer or proxy pattern)
- Protocols and interfaces bring interface features to C, with category interfaces even allowing one to extend existing types

### PHP

- Developed and implemented by Rasmus Lerdorf in 1993 and first released in 1995
- Name is a recursive initialism PHP: Hypertext Preprocessor
- Dynamically and weakly typed, with option to gradually add run time strong type assertions
- Multi-paradigm: imperative, functional, object-oriented, procedural, reflective
- Interpreted or just-in-time compiled
- The original server-side rendering platform
- Used for websites (Facebook, Wikipedia, and many more) and also many content management systems (Wordpress, JOOMLA).

#### Why it's great

- It is ubiquitous – PHP is in use on 77.4% of all websites^1, independent of specific platforms
- Simple syntax, similar to other established programming languages – java, javascript, c, which makes it easy to learn
- General purpose. Use it for many uses – From creating small web scripts to creating large server-side applications run by enterprises.
- Very established with wide adoption. Many learning resources, frameworks and libraries exist.
- Strong database support
- Still in active development releasing modern features
- Cross platform. Runs on everything – Window, Mac, Linux, Unix
- Open source and free

#### Standout features

- Simple to run and deploy. No build chain. No compilers.
- Gradual Type System. Add types where you need them, use dynamic typing to simplify parts of your development.
- Fast prototyping. Create a webpage to test your idea and run it on your own machine.

### PureScript

- Designed by Phil Freeman and first version released in 2013
- He started to work on PureScript since he wasn't satisfied by other attempts to transpile Haskell to JavaScript
- Strong and statically typed
- Compiles to JS
- Purely functional language
- Syntax and features inspired by Haskell
- Used to build web applications, but can also be used to build server-side apps or desktop applications via Electron

#### Why it's great

- Shares much of what makes Haskell great:
  - Strong and powerful type system: algebraic data types, type classes, higher-kinded types
  - Expressive: pattern matching, type inference
  - Safety: no nulls, immutable types
  - Purely functional: side-effects are encoded in the type system
- Easy, type-safe decoding/encoding of JSON to types
- Compiles to human-readable JavaScript
- Good tooling

#### Standout features

- Functional core is perfect for type-safe web applications without runtime errors
- Excellent JS interop
- Compiles to efficient JS

### ReasonML

- Created by Jordan Walke at Facebook and first version released in 2016
- Based on OCaml, but with idiosyncrasies removed and designed for JS interop
- Statically typed and functional language
- Compiled
- Used to build websites (e.g. at Facebook)

#### Why it's great

- All the goodness of OCaml but in a web environment:
  - Powerful type system: all values are typed with simpler types (such as records, variants and options) favored over complex types. No more undefined errors which improves reliability
  - Expressive: pattern matching, type inference, destructuring
  - Safety: no nulls, immutability by default
- Compiles to human-readable JavaScript
- Can be compiled to OCaml (and vice versa), meaning it can use the entire OCaml ecosystem (e.g. to compile to a native binary)

#### Standout features

- ReasonML compilation times are super fast which means fast iteration cycles.
- Excellent JS interop, both for using JS from ReasonML code as for exporting ReasonML to JS. It can even generate TS types. Can also interop with C. Even supports JSX-like syntax

### Swift

- Swift's development was started by Chris Lattner in 2010 and announced worldwide at the WWDC event in 2014.
- Goal was to replace Apple's old programming language Objective-C, which hadn't received any major changes since the early 80s, with a new, modern language. Designed to interop with large portions of Objective-C.
- Strong and statically typed
- Compiled, using LLVM to handle the compilation to machine code (like e.g. Rust)
- Multi-paradigm: functional, object-oriented, imperative, declarative
- Originally proprietary software, but open-sourced in 2015
- Used primarily for mobile and desktop apps, but is also used for backends and in serverless scenarios

#### Why it's great

- Modern language: type inference, pattern matching, algebraic data types, Unicode strings
- Productive: Swift adopts the best parts of other languages (like Rust, Python, C# and Ruby), molding them into one consistent, productive language
- Safe: pointers are not exposed, an optional type that prevents null-pointer exceptions, explicit error handling and automatic memory management via ARC (Automatic Reference Counting)
- Updated regularly. Early on, Apple was not afraid to introduce breaking changes for things that have proven to not work well. This prevents “baggage” from accumulating. A tool is usually made available to help in migrating code. Since Swift 5, the Application Binary Interface (ABI) is stable
- Contrary to Objective-C, Swift runs on all major platforms: macOS, Windows and Linux

#### Standout features

- Fast. Compiles to efficient machine code, making it run fast
- Seamless interop with Objective-C, but also interops well with C and C++
- Large community, with many excellent resources being available

### TypeScript

- Created at Microsoft in response to frustration developing large-scale applications in JS. One of the designers was Anders Hejlsberg, the lead architect of C# and creator of Delphi and Turbo Pascal
- First version was released in 2012
- Multi-paradigm: functional, prototypical, imperative, object-oriented and generic
- Uses gradual and duck typing
- Compiled (to JS)
- Used for websites, both frontend and backend, scripts and command line tools

#### Why it's great

- Powerful and flexible type system: union types, literal types, tuples. Basically any pattern that can be used in JS code can be described in a type safe way in TS. The type system is so powerful that it is even Turing Complete
- Being a superset of JS allows for gradual introduction in a JS codebase
- Combines the best of both worlds: dynamic and static typing
- Fast growing in popularity, with many tools either providing typescript types or being converted to typescript. Many resources available to
- Language is updated regularly, with early adoption of upcoming ECMAScript features

#### Standout features

- Improved security and correctness: static typing can eliminate many classes of errors one typically makes with JS
- Seamless interop with JS. Custom type definitions can be added to work with JS code in a type-safe way. Custom type definitions are available for a large number
- Great tooling/IDE support. Type annotations, code completion and even safe, large scale refactoring are available in many IDEs
- Get all the benefits of running in the JS ecosystem: huge number of packages, lots of tooling, large community, etc.

## Which to try?

1. If you want to build native apps, Dart, Delphi, Java, Kotlin and Swift are great choices. That said, any of the other languages that compile to JS could also be used to build native apps. It's worth noting that the official language to build iOS/macOS apps is Swift, and for Android apps it is Kotlin
2. If you want a build web apps, CoffeeScript, Dart, Elm, Java, JavaScript, Kotlin, PHP, PureScript, ReasonML and TypeScript are great
3. If you are interested in functional programming, Elm, PureScript and ReasonML are natural choices, with CoffeeScript, Dart, Java, JavaScript, Kotlin, Swift and TypeScript also support functional programming
4. For object oriented programming, ABAP, Dart, Delphi, Java, Kotlin, Objective-C, PHP and Swift are logical candidates, with CoffeeScript, JavaScript and TypeScript also supporting this paradigm
5. If you are interested in writing business applications, ABAP and Delphi are perfect for that
