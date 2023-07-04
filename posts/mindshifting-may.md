# Mindshifting May
## Introduction

Hi everyone! I hope you’re all doing well.

The year’s going fast and we’re onto Mindshifting May - probably the month I’m most excited about, mainly because it includes Prolog!

I hope you enjoyed Analytical April. Absolutely loads of you took part and I think it was one of the most successful months so far. I also chatted to Simon Peyton Jones during April as a late Functional February interview. That was really and I definitely recommend watching it back - if only for the gorgeous line: “When the limestone of imperative programming has worn away the granite of functional programming will be revealed underneath”.

Anyway - onto Mindshifting May! As normal, Erik and I will be giving you a quick overview of what the months are about and the different languages we’ll be exploring.

So we have a whopping six languages this month: Ballerina, Pharo, Prolog, Red, Tcl (Tickle) and Unison. Each of these languages are quite different from more “mainstream” languages, so we recommend you try more than one to get a feel for how they’re different. I definitely recommend Prolog because it’s one of the languages I’ve enjoyed coding in most in my life. Erik is also very excited about Unison, so that’s another good one to try too.

## The badges

To get the Mindshifting May badge you need to complete any five exercises in one of those languages during May.

There’s also the year long 12in23 badge. To get that you need to solve five of our featured exercises in the language. If you’re watching this after May, you can do this bit at any time during the year, so you’ve not missed out. Choosing these exercises was hard as the languages are all so different, so we went for more generic exercises that are fun to solve and interesting to explore different approaches to.
- **Acronym**: convert a phrase to its acronym
- **Isogram**: check whether a phrase contains repeating letters
- **Roman Numerals**: translate a decimal number into roman numerals
- **Raindrops**: convert a number into raindrop sounds
- **Space Age**: calculate how old someone would be on the planets in our solar system

These exercises and the ones for previous months can all be found on the the #12in23 page.

## Overviews

Let’s dig in and explore the languages with an overview of each.

### Prolog:
- Different way of thinking. A program is defined as a set of relations. You then “query” the relations database to find answers using unification (pattern matching). Perfect for rule-based systems
- Little syntax, just one data type (terms) and one language structural element (clauses). Clauses are entirely built from terms and can define facts or rules.
- Very declarative. Worry less about how things are computed, but more on what should be computed. In many cases, this means less code
- Designed to work well for querying large search spaces. Different search strategies (depth first, breadth first), supports automatic pruning

### Unison
- There are no version conflicts in Unison code! A Unison function knows the hashes of its dependencies, so it can find the right version of the code that it needs.
- Unison supports live code browsing in the local development UI and hosted repositories so you can always click through to see the source code of the libraries you depend on.
- Abilities are a way to manage “effects” (e.g. IO) in a purely functional way

### Pharo
- Very little syntax, entire syntax fits on a postcard (just 6 reserved words!). Message syntax mimics natural languages, with a subject, a verb, and complements (between: 1 and: 2 +). Semantics are also simple (e.g. dead simple precedence rules).Makes it easier to learn and read
- Productivity is great, once people get through the initial learning curve. Multiple reasons for this, including the simple semantics and the little syntax, but also some of Pharo’s standout features mentioned later
- Runs on most platforms (Windows, macOS, Linux + ARM support) on a fast virtual machine (OpenSmalltalk)
- Not just a Smalltalk implementation, still actively being developed (latest SmallTalk version is SmallTalk 80 from 1980)
- Friendly community

### Tcl (pronounced “tickle”)
- Very little syntax, just 12 rules and it fits on a piece of paper. Semantics are also relatively straightforward. Makes programs easy to read and learn
- Simple concurrency via coroutines, which allows asynchronous code to be written like synchronous code
- Built-in event loop for network programming and asynchronous file I/O
- Mature, but still evolving

### Ballerina
- First-class support for type-safe, declarative processing of JSON, XML and tabular data with language-integrated queries
- Flexible types with structural typing (duck typing) being prevalent.Closed types are a way to do subtyping whilst open types gracefully handle too much data being sent. Built in data binding and validation when used in HTTP resources
- Built-in support for common integration patterns and connectors, including distributed transactions, compensation and circuit breakers
- Every Ballerina program is automatically observable by any Open Telemetry tool, giving you complete control and visibility into the code’s behavior and performance.
- Great concurrency via strands, which are lightweight threads. Non-blocking IO calls are easy. The compiler can help check sending and receiving calls between workers, avoiding deadlocks. Immutability is great for networking too
- Explicit error handling via union types and `check` syntactic sugar to help with this

### Red
- Lightweight. The entire toolchain is about 1.5 MB download, single executable.
- Portable. Easy cross-compilation. Produces small binaries without dependencies.  Low memory footprint.
- Red is its own meta-language and own data-format (like LISPs). Programs can transform/read code.
- Reactive: Objects can be linked to reduce size and complexity of program (think Excel sheets)

## Where are these languages used?

### Prolog:
- Artificial intelligence (IBM’s Watson)
- (Natural) language processing
- Distributed database for knowledge bases (TerminusDB)
- Even used to specify the type rules of the Java Virtual Machine

### Unison
- Used for writing distributed systems
- General web services
- Batch computing jobs

### Pharo
- Used for interactive tools
- Used in widely different domains: online trading platform and investment management cloud-based tool
- User interface and interaction prototyping in defense industry
- Web based application for event planning
- Moldable development environment tool for API, data and system exploration

### Tcl
- Used as glue code or embedded
- Used in CISCO router GUIs
- Various manufacturing systems
- NASA has used it on many occasions
- Other large companies include Pixar, Boeing, Intel, NBC, and many more.
- Tk, the windowing toolkit, has been adopted by other “scripting” languages like perl/python/ruby.
- Expect, a tool to automate interactive CLI applications

### Ballerina
- Use for cloud native applications
- Used by MOSIP, which is a foundational identity platform that helps governments and other organizations implement digital and foundational identity systems in a cost-effective way.

## What makes these languages interesting from a programming perspectuve?

### Prolog:
- Logic programming language (one of the first), which is its own paradigm (like OO and Functional Programming)
- Dynamically typed

### Unison
- Purely functional language
- Statically typed

### Pharo
- Object-oriented language, but in the SmallTalk sense. Different from “regular” object-oriented languages: no constructors, no types declaration, no interfaces, no primitive types.
- Dynamically typed

### Tcl
- Multi-paradigm: object-oriented, imperative and functional styles are supported
- Dynamically typed

### Ballerina
- Multi-paradigm: object-oriented, functional and declarative
- Statically typed

### Red
- Multi-paradigm: imperative, functional, object-oriented, symbolic, reactive
- Statically typed

## What are their standout features?

### Prolog:
- Flexible. Many built in predicates work in several directions. Allows one to query and create data with the same syntax. Some problems that are hard in other language trivial
- DCG is like a built-in parser combinator that is great for parsing, generating, completing and checking sequences
- CLP is an efficient way to define a program in terms of constraints

### Unison
- Code is not text but (immutable) data. Code is stored in a database and accessed and updated via the Unison Codebase Manager. Text files are just one way to get code inside the database. Immutable data also means that test results can be cached and that type checking also only has to be done once
- Definitions are referenced by hash, not by name. This is called “content-addressed” code. The syntax tree of a definition determines its hash. No versioning conflicts, renames are trivial.
- Unison docs are a first-class entity in the language and are always in sync with the functions that they describe. You can embed live examples in them and ensure that your example code compiles.
- Ideal for cloud computation: there are no builds, functions can be distributed on the fly, and there’s less time spent writing encoders and decoders for Unison service-to-service communication.

### Pharo
- Straightforward execution model: everything's an object and execution happens exclusively via messages (which are objects too). Even control flow is done via messages. Whilst the model is simple, it is very powerful. Quite different from other object-oriented languages.
- Your code resides in a Pharo image, not in text files. A Pharo image contains your application’s entire state and can be executed in a Pharo virtual machine. When you save your work, Pharo saves the entire state of the environment as an image file. This file contains all objects, their relationships, and the execution context. The image files can be shared with others and can be loaded on different machines or platforms. This allows developers to easily collaborate on a project or distribute applications built in Pharo
- Live and immersive, immediate feedback during runtime via Pharo-specific IDE. Run and change your program on the fly, even whilst it is running! Powerful debugger that supports restarting of methods and on the fly fixing of bugs

### Tcl
- Straightforward type system: everything is a string. “Everything is a string” was how Tcl used to be implemented. Now, under the hood, there is a robust type system, where the Tcl entity (be it a string, float, list, dictionary) has a type-specific representation as well as a string representation. This greatly improves the performance of Tcl code, as it no longer needs to convert back-and-forth from strings.
- “Everything runs as commands”. There are no builtin commands. Tcl ships with a “standard library” of commands, including if and while, etc. It’s very simple to add new control flow commands: for example an until loop. It’s also easy to override Tcl command.
- Due to being compact, simple semantics and being implemented as a C-library, easy to embed

### Ballerina
- Cloud native. Built in conversions from JSON to user-defined types. Super lightweight syntax for creating (micro)services. Built-in concurrent execution of services. Support HTTP (1 and 2), graphql and gRPC out of the box
- Automatically generate artifacts to deploy your code into different clouds. These artifacts can be Dockerfiles, Docker images, Kubernetes YAML files, or serverless functions.
- Built-in visualization of code as sequence diagrams. Great to visualize flow of code. Can even visualize HTTP calls

### Red
- Great for building/parsing Domain Specific Languages/”dialects” (Rebol terminology). Several built-in dialects:
- Red/System: a C-level system programming language compiled to native code
- Parse: a powerful PEG parser
- VID: a simple GUI layout creation dialect
- Draw: a vector 2D drawing dialect
- Rich-text: a rich-text description dialect
- Easy GUIs. Fully cross-platform and native. Supports two-way binding, live-updating, events, and provides access to the OS’es features

## Which one(s) should people try during May?

They’re all interesting languages in their own right, so you could make an argument for any of them.

- If you’re interested in cloud computing, Ballerina and Unison are great options. Tcl has great concurrency features too
- If you’re familiar with object-oriented programming but want to see a different take on it, try Pharo
- If you want to experience what it is like to program in a language that isn’t backed by text files, try either Pharo and its unique and powerful IDE, or Unison with the Unison Codebase Manager.
- If you like minimalism, Tcl, Prolog, Pharo and Red all have fairly little syntax and relatively simple semantics
- If you want to see an interesting blend of paradigms, Ballerina, Tcl and Red all support different paradigms
- If you’d like to try out some more unusual paradigms, try Prolog for Logic Programming, Red for Reactive Programming and Ballerina for Declarative Programming
- If you like functional programming, check out Unison, and in particular its Abilities.
- If you are interested in metaprogramming, Tcl, Prolog, Pharo and Red all have great support

Of course, if you have the time I would recommend you trying out a couple! They’re all quite unique. Go solve the same exercise in a couple of the featured languages and see how different the implementation is.
