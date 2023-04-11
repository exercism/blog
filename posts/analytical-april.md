Hi everyone! We’ve had Functional February and Mechanical March. Now it’s time for Analytical April, in which we’re going to be focussed on languages that are great for data science.

As you’ve come to expect from the last few months, in this video Erik and I will be giving you a quick overview of what the month’s about and the different languages we’ll be exploring.

So as normal, Erik’s going to be talking us through the languages in a bit, but I’ll start by giving some of the practical details of the month.

So firstly, the featured languages for this month. We have just three this month: Julia, Python and R. Each of these languages is quite different, and obviously Python is a very multi-purpose language, but we’re going to encourage you to try and use these languages with a data-science mindset this month.

To get the Analytical April badge you need to complete five exercises in one of those languages. We’ll explore the differences between them shortly, but in Exercism terms, our Python track has a fantastic syllabus, so I really recommend you try that out. We’re also hoping to get a Julia syllabus launched during the month - a lot of the work for that is done and it just needs polishing. R doesn’t have a syllabus but it’s got lots of interesting exercises for you to play with.

We have five featured exercises to try:
- etl: in which you can explore reshaping data into a different format
- largest-series-product: where you can practice efficient ways of look for patterns in a string of digits
- saddle-points: to explore working with multidimensional arrays/matrices
- sum-of-multiples: to practice filtering and summation of a sequence of numbers
- word-count: convert a string into words and count them

A reminder that as well as the Analytical April badge, there’s a year-long #12in23 badge that you can get for solving the various featured exercises at any time during the year. So you’ll need to solve those 5 exercises in Python, R or Julia sometime this year to get that badge! For the full list of exercises, there’s a forum post linked from the Analytical April page.

Finally, before we dig into the languages, a reminder that during March we launch our new Discord server. There’s been loads of fun activity there, so make sure you check that out. The link is in the description below!

Right, let’s explore the languages. Let’s get a quick overview of each of the languages and then we’ll dig into their features and use cases. Let’s start with Python.

Python
- Conceived and developed by Guido van Rossum in the late 1980’s as a successor to the ABC programming language. First released in 1991.
- Developed in the Netherlands at the Centrum Wiskunde & Informatica (CWI) (famous for being the place where Edsger Dijkstra did most of his work), a government funded research lab. 
- Guido programmed using C and shell scripts, but both had downsides. Python aims to get the best of both worlds, without the downsides.
- Managed by Python Software Foundation and language changes happen via Python Enhancement Proposals (PEPs) (akin to RFC’s)

R
- Created by Ross Ihaka and Robert Gentleman at the University of Auckland. R can be considered as a different implementation of the S language (with relatively minor differences), which was succeeded by S-plus, a commercial (non-open) implementation of S. Whilst R shares most syntax with S, its semantics are inspired by Scheme
- Goal: create a language that was better suited to statistical computing and graphics and easier to use than comparable software designed by computer scientists

Julia
- Developed by Jeff Bezanson, Stefan Karpinski, Viral B. Shah, and Alan Edelman in the open, has more than a thousand contributors currently
- Goal: build a free, high-level language that has the speed of C, the dynamism of Ruby, the metaprogramming of LISP, general purpose skills of Python, statistics support of R, linear algebra support of MatLab and string processing power of Perl, all whilst being able to support massively parallel execution
- Excellent for scientific computation, but also a general purpose language (Genie framework for web apps)

Like with many languages, all three of them were built out of dissatisfaction :)

Ok great. So in terms of use-cases, when would you use each of these languages vs the others?

Python
- True general purpose language (websites, scripts, scientific computing)
- Can be used for many different purposes: AI (TensorFlow), scientific computing (NumPy) scripts, websites (Django), embedded systems (micro python), interfacing with hardware (e.g. raspberry pi), games (EVE online) and Python even went to Mars
- Great to learn programming with: wealth of resources and huge community. Lots of guidance on writing Pythonic code (i.e. how to write idiomatic Python code, examples) being “Explicit is better than implicit” and “Readability counts”). Many OS-es have it installed by default
- One of the most used languages at this moment, so a lot of documentation, libraries and a large community

R
- R is used in a wide variety of places, including by researchers to analyze data from experiments, universities to teach statistics and data analysis, financial sector as statistics are key (e.g. for insurance), same with retail (Amazon uses R for data analytics) and manufacturing (John Deere estimates how many spare parts to produce), National Weather Service helps predict weather and disasters, data journalism (analyzing real word data and making sense of it, often with visualization), heavily used in healthcare, e.g. determining safety of a drug based on pre-clinical trials

Julia:
- Great for scientific computation, data mining, machine learning, linear algebra and distributed computing. Notation will feel similar to mathematical notation, thus equation to code is relatively easy
- Distributed computing: tasks (=coroutines) and channels allow running code in parallel communicating with each other, multi-process support using message passing (great for high-performance computing)
- Used in Celeste project (supercomputer running Julia code to analyze 178 terabyte of astronomical data) (makes Julia part of the petaflop club as a result, which only C, C++, and Fortran were at the time, Julia first dynamic language, a quadrillion floating-point calculations per second. 1 with 15 zeros), Clima (Climate modeling alliance) has people from Caltech, MIT, and NASA’s Jet Propulsion Laboratory develop a climate forecast model, CERN, ASML


And from a programming perspective, how do they differ? Are they functional, OOP, etc?

Python:
- Dynamic and strongly typed
- Multi-paradigm: imperative, functional, but really an object-oriented language (everything is an object)
- Default interpreter CPython compiles to bytecode and then that is interpreted in a virtual machine. PyPy is a replacement for CPython that just-in-time compiles to machine code

R: 
- Dynamic and strongly typed
- Multi-paradigm, functional core but also supports procedural or object-oriented styles

Julia:
- Dynamic and strongly typed, compiled just-in-time
- Multi-paradigm: imperative, object-oriented (overloading via multiple dispatch), functional (higher order functions, partial application, pipe operator)
- Code is compiled just-in-time ahead-of-time at runtime

And continuing to look at these from a programming perspective, do any of the languages have any particular standout features?

Python:
- Pleasant syntax: whitespace sensitivity makes scoping easy to see. Code is usually easy to read, e.g. human-readable boolean conditions (and/or)
- Expressive: do much with fairly little code (list comprehensions, generators, decorators)
- Vast wealth of libraries available for wide variety of purposes
- As mentioned before, it is truly a general purpose language, as it can be used in many different scenarios

Julia
- Multiple dispatch. Decide what function to call based on the types of all the arguments (like function overloading)
- Dynamic but great performance. Julia performance can rival that of Fortran and come close to that of C. “Normal” code is often performant (no crazy hacks needed, smaller functions are actually encouraged). Libraries to support running code on GPU
- Distributed computing: tasks (=coroutines) and channels allow running code in parallel communicating with each other, multi-process support using message passing (great for high-performance computing)
- Great for scientific computation, data mining, machine learning, linear algebra and distributed computing. Notation will feel similar to mathematical notation, thus equation to code is relatively easy

R: 
- Flexible data types: vector is the core type, even scalars are vectors. Vectors can have metadata associated with them (e.g. the names for its elements). Lists are heterogenous (can have elements with different types). Special dataframe type for collection of vectors (all of the same length).
- Vectorized operations allow for concise, efficient, readable updating of vectors
- R is an integrated suite of software facilities for data manipulation, calculation and graphical display. Easy exploration, visualization, manipulation of data via R Studio. Great for data mining
- Great community, friendly and diverse. The R for Data Science Online Learning Community is a community of R learners at all skill levels working together to improve their skills. There is an open Slack group where members can keep in touch and help each other out with problems.


If someone is unsure which to try during April, how would you recommend they make the decision?

Like everything in IT: it depends! In this case, I’d say it mostly depends on your goals and personal experience.

If you’re relatively new to programming, are interested in AI or machine learning or want to learn a language that you can use for many different things, I would probably recommend starting with Python:
The number of resources available for Python is gigantic, which includes many free online courses
Python is used all over the place with AI and machine learning 
Python can be used for a great number of purposes
The Python track has Learning Mode enabled, which can help you learn the core concepts of the language in a fun way

If you are interested in doing statistical work, want to explore and visualize data or if you’re curious about a different way to work with data, the R language is a great choice:
R’s data types are based on collections of data (vectors/lists) and operations can be applied to collections with ease (no looping needed)
The RStudio IDE is great for exploring and visualizing data
R has excellent support for statistical analysis
R allows for easy plotting of data

If you are interested in scientific computing, want to run code concurrently, really care about performance, or want to learn a modern, elegant language that offers something different from most other languages, I would recommend Julia:
- Multiple dispatch will be new to many and is incredibly powerful
- Julia is great for scientific computing
- Julia’s type system is flexible and expressive
- Julia has excellent performance
- Julia is great for concurrent execution

Of course, if you have the time I would recommend you trying out all three! You never really know what language you’ll enjoy unless you’ve tried it.

