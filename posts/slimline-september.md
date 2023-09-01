# Slimline September

## Introduction

Hi everyone! I hope you're all doing well.

We've had a big August at Exercism. We've merged Premium and Insiders, added automated feedback directly into the editor, launched Track Trophies, and made loads of small improvements to the site too! If you've not checked your tracks yet to see which trophies you get, definitely do that. We've sent an email out to everyone that's got one or more trophies, so keep an eye out for that too.
During August we also had loads of fun in #12in23, exploring languages that people normally use to create Apps.

This month is Slimline September, in which we're exploring languages that tend to be very concise and terse in their syntax. Specifically we're looking at 8th (a descendant of Forth), AWK, Bash, jq, Perl and Raku (which used to be known as Perl 6).

## The badges

To get the Slimline September badge you need to complete any five exercises in one of those languages during September.

There's also the year long 12in23 badge. To get that you need to solve five of our featured exercises in the language.

- **Gigasecond**: work with dates
- **Atbash Cipher**: work with strings
- **Darts:** work with numbers and conditionals
- **Luhn**: work with strings, conditionals and numbers
- **Series**: work with strings and sequences

These exercises and the ones for previous months can all be found on the the #12in23 page.

## Overviews

Let's dig in and explore the languages with an overview of each.

### 8th

- Was developed by Ron Aaron.
- Name is a pun on the Forth language, which is its main inspiration. Lots of differences from Forth though:
  - Strongly typed
  - Cross-platform
  - Improved security (no direct memory access or built in assembler)
- Offers both a free and commercial version, with the latter offering more features.
- Closed-source, but source code may be viewed once an enterprise license is bought

### AWK

- AWK was created at Bell Labs in the 1970s by Alfred Aho, Peter Weinberger, and Brian Kernighan. The name is an acronym of the surnames of its authors.
- It's a domain-specific language, designed to do text processing, but it can be used for other purposes too
- AWK is a Unix filter, like sed and grep, intended to be used in a pipeline
- The Single UNIX Specification and Linux Standard Base specification both require it to be included in any implementation, which is why available on most \*nix machines
- Different implementations of the AWK language:
  - awk (or oawk for original AWK): the original implementation
  - GNU AWK (gawk), released in 1988 and significantly revised and expanded the language
  - BWK AWK (a.k.a. nawk), released in the late 90s
  - mawk: fast bytecode interpreted implementation
- On many \*nix systems, the `awk` command is a symlink to either `gawk` or `nawk`

### Bash

- Bash is a Unix shell developed by Brian Fox and was released in 1989.
- Designed as a free replacement for the Bourne shell and has become the default login shell for most Linux distributions. It is a superset of Bourne shell command syntax, which makes it easier to transition
- Expands on Bourne shell in numerous ways: brace expansion, command-line completion, signal handling and more

### jq

- Developed by Stephen Dolan and released in 2012
- Designed to allow easy querying, transforming and manipulating of JSON documents ("sed for JSON")
- The `jq` tool (implementing the language) was originally implemented in Haskell, but subsequently ported to C. There are also Go and Rust-based ports

### Perl

- Perl was developed by Larry Wall in the late 1980s and first released in 1987.
- Designed as a general-purpose scripting language to make report processing easier
- Very influential, particularly its regular expression support (we'll come back to that later)

### Raku

- Designed by Larry Wall (creator of Perl) and released in 2015
- Originally known as Perl 6, it was meant to clean up the language and remove some features that were considered of little use or confusing (fun quote: "In Perl 6, we decided it would be better to fix the language than fix the user.", Larry Wall). Perl 6 ended up not being source compatible with Perl 5, so it was renamed to Raku
- Design philosophy centers around making programming enjoyable and productive while providing a wide range of tools to tackle a diverse set of programming challenges (general purpose)
- As Raku is a specification, there can be (and are) multiple implementations. The only actively developed implementation right now is Rakudo, but there are older implementations like Pugs (written in Haskell), v6-KindaPerl6 and Niecza (targeting the CLR)

## Where are these languages used?

### 8th

- Unfortunately, we couldn't find where it is being used

### AWK

- Used for data extraction and reporting, and scripting in general

### Bash

- Primarily used for system administration, but also used to provide CLI utilities or wrappers around other tools. We've used it tons to bulk work with Exercism repos

### jq

- Used to query, transform and manipulate JSON documents, often in the form of shell scripts.

### Perl

- Used for data manipulation, file parsing , web programming, and system administration tasks. It gained popularity in the early days of the web due to its string manipulation capabilities and extensive module ecosystem.

### Raku

- Used for text processing, system administration, and more

## What makes these languages interesting from a programming perspective?

Most languages are dynamically typed and interpreted, which fits well with their scripting nature. That said, there are some exceptions, especially in the supported paradigms.

### 8th

- Strongly typed
- Multi-paradigm: procedural, but more interestingly stack-based (stack-based execution model), reflective (ability to examine and modify its own structure and behavior) and concatenative (all expressions are functions and juxtaposition of functions denotes function composition)
- Compiled to native code, but can also be interpreted in a REPL

### AWK

- Dynamically typed, and often interpreted (depends on the implementation being used)
- Main paradigm is data-driven, where you describe a program as statements that describe the data to be matched and the processing required, instead of explicitly defining a sequence of steps to be taken. AWK does support procedural programming

### Bash

- Dynamic and interpreted language
- Supports imperative and procedural programming

### jq

- Dynamic and interpreted language
- Purely functional language (all values are immutable), with an emphasis on "pipelines". Feels very Unix-y

### Perl

- Dynamically typed and interpreted
- Multi-paradigm, supporting functional, object-oriented and imperative programming

### Raku

- Dynamically typed, but supports gradual typing, where static typing can be added where needed (Perl is dynamic)
- Multi-paradigm language: imperative, procedural, object-oriented and functional

## What makes them great languages?

### 8th

- Very little syntax makes the language easier to learn and understand. Uses JSON to describe data (like objects and arrays). Also supports other containers like stacks, queues and heaps
- No reserved keywords. Subroutines are called "words'', and new words can easily be defined. All words can be redefined whilst running, built-in or user-defined
- Cross-platform. Easily generate an executable for any supported platform
- Secure. Built-in security features to prevent a wide range of bugs (no direct memory access, runtime does not link to dynamic libraries)

### AWK

- Simple syntax with a very consistent structure of AWK code, which makes it easy to learn and read AWK code. Its data structures are also simple and flexible
- Very expressive, where you can do lots with very little code. Perfect for one-liners
- Installed on most \*nix machines, which means that you can use your AWK skills in many places (together with /bin/sh, only scripting language in standard Unix)
- Works really well in pipelines and shell scripts, where AWK processes the output of other tools or vice versa

### Bash

- Can be used on most platforms. It is installed on almost all \*nix machines, including macOS. With Windows Subsystem for Linux (WSL), bash is now also available to Windows systems.
- Use as a RE(P)L where you run individual commands, or read and execute code from files (known as shell scripts). If you've used a Linux terminal, you've likely written bash code as the terminal usually is a bash RE(P)L
- Bash and shell scripts are widely used for system administration, devops and computer management.
- Extremely versatile and flexible
- Powerful string manipulation capabilities, including very straightforward string interpolation

### jq

- Simple, short syntax for working with JSON, making it easy to learn
- Allows custom function definitions for more complex operations.
- Supports tail recursion optimization, which is great for recursively processing data
- The jq tool is distributed as a single binary which is only 30-ish KB of size
- The `yq` tool wraps `jq` to allow for using the same syntax to manipulate XML, TOML and YAML files (it converts those data types to JSON under the hood)
- Both the C and Go implementation support being embedded in other applications

### Perl

- Runs on most platforms. Great for writing cross-platform scripts
- Flexibility is a cornerstone of Perl's design philosophy. Its famous motto is: "There's more than one way to do it" (TMTOWTDI). Different approaches can be used depending on the task at hand
- Strong community and a legacy of influential projects. Many scripts, tools, and applications have been developed using Perl. Once referred to as: "the duct tape to holds the internet together"
- Rich ecosystem of modules and libraries, available through the Comprehensive Perl Archive Network (CPAN)

### Raku

- Large, complex, and powerful, but also designed to be a language you don't have to learn all at once. Easy to get started with, and one can dip into the more powerful features later on
- Powerful and extensible type system that includes gradual typing. This means you can specify the level of type checking you want, allowing for a balance between dynamic and static typing
- Supports multiple-dispatch, which allows you to use polymorphism without inheritance
- Unicode is a first-class citizen in Raku. It provides native support for handling different character encodings
- Provides advanced concurrency and parallelism features. It includes built-in support for asynchronous programming, reactive programming, and parallel execution

## What are their standout features?

### 8th

- Requires different way of thinking. Its unique blend of paradigms is very different from other languages and challenges you to come up with different ways in which to approach things
- Stack-based and Reverse Polish Notation (RPN) syntax make for a very simple mental model of program execution.Values are put on the stack and most words are defined in terms of effect on the stack

### AWK

- Data-driven paradigm is very powerful. Requires a different way of thinking in that programs are defined as a set of condition/action pairs and that text is split into records (typically one line per record) and each record is split into fields (e.g. CSV fields or one word per field). Once you've gotten used to this, you'll appreciate the elegance and expressiveness of this approach, and you'll start seeing uses for it everywhere
- Perfect for working with text. Whether that's parsing text, transforming text, or reporting, AWK has got you covered. Tasks such printing the shell for each user on the system or summing a CSV column, you'll be amazed how little code you need

### Bash

- Perfect for automation. Shell scripts are excellent for automating repetitive tasks.
- Bash scripts use pipelines and let you glue together other programs with ease. It is trivial to create a script that pipes the output of one command to another command, or to have a script fail once any of the executed commands fail.
- Powerful. The easy with which other tools can be used makes bash an incredibly powerful tool

### jq

- Great for easily and cleanly extracting/manipulation JSON data (which we have tons of nowadays). Has become the de facto tool to transform JSON data. You can even create JSON data with jq
- Supports streaming data, which means that you can work with "infinite" data without memory issues
- Emphasis on pipelines will be easy to pick up for anyone familiar with streams, e.g. Unix tools. It also makes jq code fairly easy to reason about

### Perl

- Famous for its succinctness and expressiveness. You need very little code to do much
- Especially well suited to working with text, in large part due to its powerful regular expression support. Perl 5 in particular introduced a lot of new features (like backreferences, named capturing groups and lazy quantifiers). Philip Hazel built PCRE (Perl Compatible Regular Expressions), a C library that implements a Perl 5-compatible regular expression engine. Even languages that don't build on PCRE often design their regular expression support to be PCRE compatible (and thus use Perl 5 syntax)

### Raku

- Supports auto-threading junctions, which help make parallelism much easier to work with
- Supports lazy evaluation, allowing you to work with infinite lists and sequences without running into memory issues. This is particularly useful when dealing with large datasets or when working with algorithms that involve infinite streams of data
- Great for text processing, providing a simpler, more readable, and more powerful regex syntax
- Built-in support for defining custom domain-specific languages (DSLs) using grammars. This allows you to create parsers for specific data formats or languages, making it easier to work with complex textual data

## Which to try?

1. If you're primarily using a Unix system or doing devops, Bash is an invaluable language to be learning. Learning AWK, Perl or Raku can also be really beneficial, with the first two also pre-installed on many systems
2. If you're working with JSON (or XML/YAML/TOML), jq is an obvious choice
3. If you want to process text, AWK, Perl and Raku are the obvious choices.
4. If you'd like to try something a bit different, 8th is a great option
