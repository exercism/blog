# Jurassic July
## Introduction
Hello. Welcome. Hope you’re all doing well
June’s been a big month at Exercism with the launch of Premium and our 10 year anniversary.
And I hope you’ve had fun playing with Lisps during the Summer of Sexps.
Now onto Month 7 of 2023, and our 6th themed month - Jurassic July.

What do we mean by Jurassic?
Well, not that these languages are extinct - although you’re unlikely to be writing new software in COBOL now-a-days
But these are some of the oldest languages - some over 60 years old.
An incredible amount of software (especially enterprise software) has been written in them.
They’re all incredibly successful languages.

So what are the languages: Well we’re looking at C, C++, COBOL, Fortran and Visual Basic.
We’re not going to be exploring C and C++ in this video as we already covered them in Mechanical March - so check that video out if you’re interested in those languages. But we’ll be looking at COBOL, Fortran and Visual Basic in a bit!

## The badges

Get the badge by completing 5 exercises in one of those this month.
And for the year-long badge, you need to complete:
- **Bob**: work with strings and conditional logic
- **Allergies**: work with strings, numbers and bitwise operations
- **Reverse String**: iterate over the characters in a string
- **High Scores**: iterate over arrays of numbers
- **Armstrong Numbers**: work with numbers and looping/iteration

## Overviews

### Fortran
- Initiated by John Backus at IBM in the 1950s to develop a more practical alternative to assembly language for programming their IBM 704 mainframe computer
- Designed to be good at building scientific and engineering applications (name is short for Formula Translating System)
- First high-level programming language (reduces lines of code by about a factor 20)
- Also the first optimizing compiler (customers were reluctant to use a high-level programming language unless its compiler could generate code with performance approaching that of hand-coded assembly language)
- Static and strongly typed language
- - Initially only supported imperative programming, but procedural programming was added soon after that. Later extensions added support for other paradigms, like object-oriented programming and array programming
- Standardized, first in 1966 with Fortran 66, and last updated in 2018!
- Highly influential, from Basic to ALGOL, inspiration for many languages. Much of the early programming language research aimed to help improve Fortran

- Still being actively developed, with new features being added, whilst still having strong backwards compatibility guarantees (old code usually still compiles and runs)
- Built-in parallelism using coarrays, a safe and efficient method of expressing parallelism. Functions can be marked as pure, which helps the compiler optimize for parallel computing
- - Safe memory handling using allocatable variables, where the compiler is responsible for freeing memory.
- Built-in interoperability with C

### COBOL
- Designed in 1959 by the CODASYL consortium (sponsored by the Department of Defense!) in an effort to lower the costs of developing business applications (name stands for Common Business-Oriented Language)
- Became a standard in 1968, with the latest revision from 2014
- Different implementations, such as IBM COBOL, GnuCOBOL (which compiles to C) and Micro Focus™ Visual COBOL, which runs on both the JVM and .NET runtime
- Statically typed language
- Multi-paradigm, supports imperative and object-oriented programming

- Verbose (many keywords) but very human readable syntax. Benefits readability and maintenance
- Good backwards compatibility, with a stable specification. Battle-tested
- Good performance (used in finance)

### Visual Basic
- Developed by Microsoft as successor of Visual Basic that runs on the .NET runtime (the .NET suffix was dropped after Visual Basic 2003)
- First version was released in 2002 and the language was marked as “stable” in 2023. This means that no new syntax will be added to the language, but it is still a supported language
- Mostly shares syntax with Visual Basic, but some changes were made
- Statically typed language that supports strong and weak typing
- Multi-paradigm language: primarily object-oriented, but also imperative and event-driven programming

- Easy to learn (Visual Basic was designed to be easy to learn)
- Excellent support for object-oriented programming
- Runs on tried-and-tested .NET runtime, with access to all .NET libraries
- Easy deployment with ClickOnce deployment

## Use cases

### Fortran
Used in high-performance computing scenarios (supercomputers), such as weather forecasting, astronomy and structural engineering. It is also used in CAD software and many applications build on FORTRAN, e.g. various NumPy modules use FORTRAN 77 libraries

### COBOL
Used a lot in finance, with many financial systems still running in large parts on COBOL software (estimates say around 80% of financial transactions are powered by COBOL), although it’s mostly maintenance nowadays. Also used for many business applications, and even a key/value store used at Walmart.

### Visual Basic
Used for GUIs (e.g. interface to databases) and server-generated websites. Companies include Boeing, Wells Fargo and General Electric

## How do they differ from a programming perspective?

### Fortran
Initially only supported imperative programming, but procedural programming was added soon after that. Later extensions added support for other paradigms, like object-oriented programming and array programming

### COBOL
Multi-paradigm, supports imperative and object-oriented programming

### Visual Basic
Multi-paradigm language: primarily object-oriented, but also imperative and event-driven programming

## Standout features

### Fortran
- Performance. The Fortran language and its data types/data structures are designed to be efficient/have great performance. This being used in supercomputers
- By default, supports many mathematical functions
- Array programming is a very neat way to apply operations on arrays and sections of arrays without having to do any manual iteration or specifying array boundaries

### COBOL
- Fixed-point arithmetic doesn't have rounding errors, unlike floating point numbers. This makes it great for finance
- Great for reading from and writing to files (records)
- COBOL built-in support for generating reports (which is another reason why it has been popular in business applications)

### Visual Basic
- Excellent for building GUI applications using Windows Forms. Drag and drop WYSIWYG editor
- Great IDE support, with refactorings, code completion and tons more

## Which to try?

- If you’re interested in scientific computing or high performance, Fortran is an excellent choice
- If you want a feel for how business applications used to be built, COBOL is great
- If you are interested in building GUI applications or are already on the .NET platform, Visual Basic works really well
- If you are interested in the history of programming, COBOL and Fortran are both nice tracks to check out




