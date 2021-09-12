At the start of September 2021, Exercism v3 finally launched.
Angelika Tyborska is one of the key maintainers that helped us get over the line.
As well as being the co-creator of the Elixir Learning Exercises and Syllabus, Angelika was a key voice throughout the development of v3, adding ideas and insight throughout the build-process.
She is a key Exercism contributor.

In this video presentation, Angelika talks us through what problems v3 was designed to fix, some of the key additions to the platform, and how everything fits together, exploring Analyzers, Representers and the new Learning Exercises.

## Transcript

### Exercism history

Exercism has been around for a while. It was first created in 2013 by Katrina Owen as a tool for
her students.  In v1, it was just a collection of interesting Practice
Exercises. In v2, it became a platform for free code mentorship.

### v3 🚀 01.09.2021

On the 1st of September, Exercism version 3 was released.

In this video I will talk you through the changes in v3, explain why they were made, and how they will improve your experience on Exercism.

### About me

This is me [[photo shown at 0:38](https://youtu.be/ijQof_ASicw?t=38)]. I'm Angelika. Together with my co-maintainer Tim we built the tooling and over 30 learning exercises for the Elixir track for Exercism v3. I believe that in its new form, Exercism has the potential to become the best tool for learning new programming languages.

### What is new in v3?

What is new in Exercism v3? Short answer: A lot.

All major changes introduced in v3 are meant to address the biggest problems that people experienced in v2.

### Problems in v2

There are three key problems that v3 addresses.

One: difficult initial setup, two: code practice without learning, three: long mentor response time.

#### Problem 1. Difficult initial setup

Problem number one: difficult initial setup. To start with Exercism, you need to install the Exercism CLI, the programming language that you want to try, and you need to feel comfortable in the terminal. You need to configure your editor to do syntax coloring for the new language, and so on. For advanced developers, all of that setup is an inconvenient time sink. But for beginners, it can be a hurdle impossible to overcome.

The solution: let people code in the browser. No initial setup necessary.

To facilitate this, Exercism has now a web editor, and each programming language has its own Test Runner dedicated to running tests for Exercism exercises.

##### Web editor

This is the web editor [[sceenshot shown at 2:25](https://youtu.be/ijQof_ASicw?t=145)]. It has two panels, the source code on the left and the instructions and test suite on the right.

It doesn't have any fancy features because its goal is not to be a replacement for your favorite tools. Its goal is to let you postpone installing all the necessary tools and dependencies until after you feel more comfortable with the new programming language and you know you want to continue working with it.

The web editor is entirely optional. You can continue using the CLI and work with your favorite tools on your own computer.

##### Test Runners

For the web editor to be usable, there needs to be a way to run the tests against the solution that you write in the browser. This is the job of a Test Runner.

Each language on Exercism has its own Test Runner. The Test Runner is responsible for reporting test results, but that's not all. It also needs to extract the test's body so that you know what code is being executed so that you can interpret the failure message, but also capture the test's output so that you can debug
your code in the browser using `puts`, `print`, `console.log` or whatever printing function your language offers.

Test Runners are crucial for solving exercises in the browser, but they will also be used on solutions submitted via the CLI. When browsing community solutions for a given exercise, or when mentoring a student, you can see if the solution passes the tests without having to download it and execute locally.

#### Problem 2. Code practice without learning

Problem number two: Exercism is a platform for code practice, but it didn't offer any resources for learning a specific language from scratch. You had to do that somewhere else first.

Exercises on Exercism were designed to be interesting and challenging, but sometimes even the easiest ones are too difficult to be an entry point to a new programming language. This is especially true when you're trying to learn a language with a completely different syntax or even using a different programming paradigm.

The solution: offer learning alongside practice.

With the addition of the Syllabus and Learning Exercises, Exercism has now become an excellent tool to dive right into a new programming language.

##### Syllabus

What is a Syllabus? A Syllabus is a tree of Concepts that make up each programming language. The Syllabus is unique to each track on Exercism because each programming language is different and has different Concepts.

The Concepts depend on one another, forming various branches of the tree. You need to learn the previous concept in the branch to unlock the next concept.

For example, this is the beginning of the Elixir Syllabus [[screenshot shown at 5:10](https://youtu.be/ijQof_ASicw?t=310)]. It starts with a concept called "basics", which covers: how to define a module, how to define a named function, and where to find the documentation for the standard library. This knowledge is necessary for every single Exercism
exercise. You need to learn basics to unlock any other concept. You can learn about for example booleans, and once you know booleans, you can learn about the cond expression, and so on.

For perspective, this is the full Elixir Syllabus [[screenshot shown at 6:16](https://youtu.be/ijQof_ASicw?t=376)]. At the moment, it contains over 50 Concepts, but it still needs to be extended.

At the top, you will find Concepts such as: strings, lists, maps, and tuples. In the middle, there's: the `Enum` module, regular expressions, structs, and writing typespecs. And at the end, there's: protocols, processes, and tasks.

##### Learning exercises

You learn Concepts from the Syllabus by solving Learning
Exercises. Learning Exercises are different than Practice Exercises. They were designed to teach programming concepts to students that don't know the specific programming language at all, but do know at least one other language and basic programming concepts.

###### Introduction

Each learning exercise starts with an introduction. The introduction describes basic information about the Concepts that this exercise teaches. Most Learning Exercises teach a single concept, but there are exceptions.

This example shows an introduction about Elixir maps [[screenshot shown at 7:12](https://youtu.be/ijQof_ASicw?t=432)]. It explains what maps are, how to define a map, how to access a value in a map and so
on. It contains some code examples to show new syntax, but it doesn't contain too many so that you cannot just copy-paste the introduction to solve the
exercise.

###### Instructions

Then, there are instructions. Instructions for Learning Exercises are split into small tasks. The tasks were designed to nudge the student into using the most crucial parts of any given concept.

For example, the learning exercise that teaches maps will have the student create a map, then read a value from a map, then update a value in a map, then get all keys from a map and so on.

There is a story to each learning exercise, but the story is not that important. It's there so that you don't have to use nonsensical values like "foo bar" and "1 2 3", but it doesn't play a big role in the exercise like it does in Practice Exercises.

###### Hints

Each task comes with a small list of hints in case the student gets stuck. The hints often reveal which specific function to use in
which task and lead you to the documentation for that function.

##### Practicing concepts

But solving a single learning exercise is not enough to really master the concept. You need to practice it too. That's why we reviewed all of the Practice Exercises that already existed in v2 and chose a few that can be used to practice each concept.

This is how a single concept looks like in the tree [[screenshot shown at 9:01](https://youtu.be/ijQof_ASicw?t=541)]. The dots represent exercises. The first dot with the light bulb icon is a learning exercise, and the other dots are Practice Exercises.

This is how a concept looks like after solving a few exercises [[screenshot shown at 9:37](https://youtu.be/ijQof_ASicw?t=577)]. Note how some of the Practice Exercises for this concept are still locked, even though the learning exercise is completed. This is because Practice Exercises are not limited to practicing a single concept. You might need to learn more Concepts than just atoms [concept shown on the screenshot] before those exercises get unlocked.

Learning Exercises are supposed to be trivial for people that are already fluent in a given language. But don't worry, they are entirely optional.  You can switch from learning mode to practice mode, which will give you instant access to all of the interesting Practice Exercises without having to work through the Syllabus first.

##### Syllabus = huge effort

One important detail that I have to mention in order to manage your expectations is that developing the Syllabus is a HUUUGE effort. Not every track has enough active maintainers to be able to have a Syllabus ready right now.

At the time I am recording this video [4th of September, 2021], Learning Exercises are only available in: Common Lisp, C#, Elm, Elixir, F#, Go, Java, JavaScript, Python, Ruby, Rust, and Swift. The Julia track will launch its Syllabus soon.

#### Problem 3. Long mentor response time

Problem number three: long mentor response time. Not every track has enough mentors. Some tracks have so few mentors that the waiting time for mentoring can be up to a month. This has always been extremely discouraging to students. It's such a core issue to Exercism, that it's getting addressed from 3 different angles.

##### Automated feedbacck

Solution number 1 is to provide automated feedback. A lot of feedback that mentors write to students is repetitive. Being able to detect common mistakes automatically and report them to the student directly is a game changer.

Getting automated feedback about common mistakes will allow the student to improve their solution even before asking for mentoring, which will also make the mentor's job easier. It will save mentors from having to mention tedious details like snake_case vs camelCase and focus on the essence of the solution. In some cases, the automated feedback will be enough to satisfy the student and they won't even request mentoring at all.

In v3, there are two types of tools for automated feedback: Analyzers and Representers.

###### Analyzers

The Analyzer is a tool that looks for specific characteristics in a solution and returns to the student a list of predefined comments about what it finds. What characteristics, it depends entirely on the language and the specific exercise.

For example, Elixir has very a specific naming convention for functions and variables. One of the checks that the Elixir Analyzer does for every
single exercise is checking all the variable names and function names. If it finds a name that is not written using snake_case, it will remind the student about the naming convention.

Another check that the Elixir Analyzer can do is to detect the usage of a specific module. For example, this check [[screenshot shown at 13:20](https://youtu.be/ijQof_ASicw?t=800)] for not using the Enum module is specific to the learning exercise for recursion. Using the Enum module defeats the purpose of the learning exercise, so the Analyzer will remind the student not to do that and use recursion instead.

###### Representers

The second tool that will help us with with providing automated feedback on Exercism is the Representer. The Representer takes the solution and removes the non-essential parts. It normalizes formatting, removes comments and documentation, and it replaces function and variable names with placeholders.

The output of the Representer is called a representation. Each solution submitted to Exercism with be passed to the Representer and its representation will be stored on the platform along with the solution.

Mentors will then have access to an interface where they can browse representations of submitted solutions. For each unique representation, a mentor can leave feedback on that representation. Then, that feedback will be presented to every student that submits a similar solution that has the same representation. A mentor only has to write feedback once and the feedback can reach everyone that needs it.

Representers themselves are already implemented and deployed for some languages, but at the time I am recording this video [4th of September, 2021], the interface for mentors is still missing from the platform, so we need to wait a bit until this feature is fully available.

##### Avoiding unwanted mentoring sessions

Another solution to a long mentoring queues is to avoid unwanted mentoring sessions. In v2, mentoring was required for core exercises. Submitting a core exercise meant that you automatically request mentoring, and you couldn't progress to the next core exercise without mentor approval. A lot of students would learn the language by working through the core exercises, so they needed the mentoring to guide them through the learning process.

This is no longer the case. The teaching role of core exercises and mentor approval has been taken over by Learning Exercises and Analyzers. In v3, mentoring is always optional and must be requested explicitly.

###### Mentoring request

To request mentoring, you need to answer 2 questions: What are you hoping to learn from this track?, and: How can a mentor help you with your solution? By knowing beforehand what are the student's expectations from the mentoring session, the mentor can pick those mentoring requests that fit their knowledge and mentoring style best, which makes it more likely that both parties will leave the mentoring session satisfied.

###### Mentoring queue & favorites

In the new mentoring queue mentors can see statistics about the student's mentoring history. They can see which student was never mentored before and might need a more careful review, and which student has been through mentoring many times and understands how it works.

Mentors can also finally find students that they mentored before and develop relationships with them. Mentors can even add students to favorites and use that to prioritize mentoring students with which they previously had a good experience.

###### Block lists

After each mentoring session, both the student and the mentor have the option of blocking the other person. There are two block lists, blocked students and blocked mentors. If I, as a mentor, block you as a student, you might still later mentor me. The other person will of course have no idea that they were blocked so they cannot retaliate against you.

You can choose to block somebody for any reason, but if they are breaking the Code of Conduct, please make sure to also report them explicitly to protect other users.

##### Mitigate negative consequences of long wait times

Finally, the last step of dealing with the problem of long wait times is to ensure that even though you need to wait sometimes, the negative consequences of the waiting are minimal. In v3, waiting for mentoring does not stop you from solving other exercises. You can still progress through the track.

A mentoring session can be ended by either side. If you're a student and you don't like the approach a particular mentor is taking with you, you can always ask for a different approach, or you can choose to leave the session. Regardless of how the mentoring session ends, the student can request a new mentoring session with another mentor for the same solution.

###### Mentoring slots

For each track, you can have from 1 to 4 mentoring slots. Having multiple mentoring slots can help you when you want to request mentoring for a difficult exercise that is less likely to get mentored fast, while still be able to get mentoring on other exercises at the same time.

Mentoring slots can be unlocked by gaining reputation. Reputation is awarded for publishing your solutions for everyone to browse, for mentoring students, and for contributing to any of the Exercism's repositories. This means that students that contribute more to the platform can get more mentoring.

### Summary

Those are some of the major ways in which Exercism has changed on the first of September 2021.

We added Learning Exercises so that you can learn without leaving the platform, a web editor so that you can code without installing anything, and Analyzers and Representers so that you can get immediate automated feedback. We also removed a lot of frustrating blockers from the mentoring process.

And there's so much else new to explore: our contributing section, badges, new profiles, a journey page with your full Exercism history, and much more.

Come over to exercism.org and give it a try.

Thank you.
