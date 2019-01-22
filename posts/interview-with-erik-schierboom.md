_An interview with [Erik Schierboom](https://exercism.io/profiles/ErikSchierboom) in which he and [Jeremy Walker](https://exercism.io/profiles/iHiD) discuss functional programming, maintaining Exercism tracks, and the upcoming static analysis of Exercism solutions._

**Hi Erik. Thanks for featuring in the first Exercism Contributor Spotlight! We wanted to highlight your work because it feels like you contribute to every bit of Exercism and have some great insights from working across the whole project!**

**So for a bit of background, how did you first get involved in Exercism?**

In 2014, I did a functional programming course that used Scala as its language. After finishing that course, I looked for resources to further improve my Scala skills and found Exercism. It didn't take long before I was hooked and also started to do other language tracks on Exercism. Having benefited greatly from comments people left on my solutions, I then started commenting on solutions in the C# track. At some point, I was asked to become a maintainer of the C# track, which I accepted gladly. Five years later, I'm now a mentor in the C# and F# tracks, a maintainer of the C#, F# and Scala tracks and help work on the cross-track problem specifications.

**Nice. So you got into Exercism really early in its life. For those who are unaware, could you explain what it means to be an Exercism maintainer, please?**

Sure. Abstractly speaking, an Exercism maintainer is responsible for a track's "health." In practice, that can mean a great many things, like implementing new exercises, updating existing exercises or reviewing pull requests from other maintainers. Another important aspect is correctly ordering a track's exercises, to ensure students have the best possible learning experience. Note that being a maintainer does _not_ mean one has to engage in all of the aforementioned activities; it is perfectly valid for a maintainer to only focus on one or two activities.

**Thanks! So as well as your focus on C#, F# and Scala, you've pretty much worked through every language track on Exercism. Do you have particular favorites from a learner's point-of-view?**

Although I've learned tons from every track I worked through, my favorite track must be the Haskell track. Not only is it a great language with lots of interesting concepts, the quality of its mentors was absolutely stunning. Other favorites are the Kotlin and F# tracks, with Kotlin and F# being extremely well-designed and pragmatic languages that I love programming in.

**Yeah, I hear a lot of great things about the Haskell mentors! I imagine working through so many tracks gave you a whole load of interesting insights into coding. Were there any things specifically that you learnt from that experience?**

Oh yes, tons of things! Working with a wide variety of languages exposes one to many different ways of approaching problems. These different approaches have all influenced my coding style in some way, although the functional languages have probably influenced me the most. I now find that I use functional concepts whenever I can, even in non-functional languages (which are slowly incorporating functional features).

I've also learnt that while every language is different, many are actually quite similar. As a result, learning a new language becomes a lot easier once you know a couple of them. For example, knowing Haskell means that one could probably pick up F# or Scala relatively quickly. Learning new languages could thus also be a good career move, as you'll be able to switch between languages more easily.

Finally, I've learnt that having mentors guide you while learning a language makes the process so much more enjoyable and effective.

**I've found the same. Learning from others is such a multiplier! From a practical point of view, how did you deal with all the setups for the different languages. I often find the thought of learning a new IDE a bit intimidating. Did you stick to an editor you knew while you worked through the languages, or vary it in order to try and get a more idiomatic experience?**

For some languages, setting up a new development environment used to be a bit of a hassle, but nowadays most languages are fairly easy to setup. I then try to find an IDE that gives me the best experience for that specific language. As I alternately work on Windows and Mac OS, the IDE should also be cross-platform. An example of a great, cross-platform IDE is [Visual Studio Code](https://code.visualstudio.com/), which I use for the [Haskell](https://exercism.io/tracks/haskell), [JavaScript](https://exercism.io/tracks/javascript), [TypeScript](https://exercism.io/tracks/typescript), [Elm](https://exercism.io/tracks/elm) and [Elixir](https://exercism.io/tracks/elixir) tracks. For the other tracks, I use a [JetBrains IDE](https://www.jetbrains.com/products.html?fromMenu): [Rider](https://www.jetbrains.com/rider/) for [C#](https://exercism.io/tracks/csharp) and [F#](https://exercism.io/tracks/fsharp), [IntelliJ IDEA](https://www.jetbrains.com/idea/) for [Java](https://exercism.io/tracks/java), [Scala](https://exercism.io/tracks/scala) and [Kotlin](https://exercism.io/tracks/kotlin), and finally [RubyMine](https://www.jetbrains.com/ruby/) for [Ruby](https://exercism.io/tracks/ruby) (note: these are also cross-platform IDE's). As you can see, I use multiple editors to get the best experience for each language (although the Jetbrains IDE's are obviously quite similar).

Pro tip: if you are core contributor to an open-source project, Jetbrains allows you to apply for a [free open-source license](https://www.jetbrains.com/buy/opensource/)!

**That's super useful. Thank you! So, you're a maintainer for C#, F# and Scala. What particularly draws you to those languages?**

C# immediately became my favorite language when it was released in 2002. It is a well-designed, elegant language with great tooling and documentation. The language also evolves quite rapidly, which means that there are always new things to learn! One last plus is that it runs on the excellent .NET (Core) framework.

F# was also love at first sight. With elegant syntax and a rich set of (functional) language features, I found that I could do more with less code, particularly when doing domain modeling. It is also a very pragmatic language, with object-oriented features and great interop with existing .NET code (it runs on the same .NET (Core) framework that C# does). An additional strength is its tooling, which is amongst the best available for functional languages. As a bonus, it also has one of my favorite language introductions ever in the [fsharpforfunandprofit](https://fsharpforfunandprofit.com/) website.

Scala was the language that introduced me to functional programming, so for that reason it holds a special place in my heart. Like F#, it is a pragmatic language, for much the same reasons. With its integration into Java's ecosystem, it has really helped popularize functional programming.

**It's interesting that you got started with functional programming through Scala, mentor F#, but rate Haskell as the best track. For someone who wants to take the dive into functional programming on Exercism, which of those would you recommend they try first?**

Great question! My vote goes to F#, as I feel it is the easiest language to pick up. This is mainly due to the F# language being less complex than the other two. F#'s excellent tooling and documentation are also a big plus when getting started. That said, I do highly recommend also joining the Haskell track once you're done with the F# track, as Haskell has some fantastic, advanced features that F# doesn't have.

**You've been privy to quite a lot of our plans for the future of Exercism. Is there anything you're particularly excited about for the project?**

Of all the improvements being planned, I'm most excited about the static analysis of solutions. The idea is that we'll setup a system that can automatically comment on submitted solutions, by programmatically analyzing those solutions for common issues/suggestions. This should help mentors a lot, as they would no longer have to comment on these common issues/suggestions and can focus on more interesting problems.

If you're interested, check out my (early) prototype of a [C# track analyzer](https://github.com/erikschierboom/exercism.analyzers.csharp), which uses the [.NET Compiler Platform](https://docs.microsoft.com/nl-nl/dotnet/csharp/roslyn-sdk/) to statically analyze C# code. 

**Yes, the static analysis is pretty much the most exciting thing for me too. It's awesome to see that you already have a prototype together. I think the speed improvements that static analysis will give us will dramatically improve Exercism, and I'm really excited about how we can extend it to teach total beginners to code. I think it's a real game-changer.**

**Final question, do you have any personal projects or causes that are close to your heart, which you'd like to give a shoutout too?**

To me, getting involved in Exercism, contributing to its open-source code base and mentoring people has been an incredibly rewarding experience. I've learned tons of things, got to know some pretty great people and feel I have been able to help many people.

I would like to encourage people to see if they can get involved too. If you have a language you are passionate about and want to help people learn—sign up as a mentor on Exercism. If you prefer writing code, choose an open-source project and contribute. I promise it is far less scary than it sounds and you'll feel great doing it!

**Awesome! Thank you for taking the time to chat and for all your work on Exercism!**

