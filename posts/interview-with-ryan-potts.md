_An interview with [Ryan Potts](https://exercism.io/profiles/rpottsoh) in which he and [Jeremy Walker](https://exercism.io/profiles/iHiD) discuss Delphi, the things he's learnt from being a contributor to Exercism, and his experiences of programming in industries that are still "offline"._

**Hi Ryan. Thanks for taking the time to chat with me. You're the maintainer of the Delphi track on Exercism. How did you get into Delphi?**

I work for a company that my father founded, which has been developing software since the 80's starting with Microsoft Pascal then later using Borland's Turbo Pascal.  I came to work at the company in '96, about this time it was receiving requests to produce software that would run in Windows, instead of DOS.  Conveniently enough Borland had recently released Delphi 1.  This was a perfect fit for us as most of the units that had been developed over the years could still be used.  No longer were we faced with having to start all over in VB or VC to support Windows.

**And you still use Delphi day-to-day now?**

Yes, where I work produces machines for R&D testing and small batch testing in the automotive industry; testing tires, car seats, airbag inflators, as well as crash testing.  All of the systems produced are used by several car manufacturers around the world as well as by their suppliers.

The software I work on is used for controlling these various types of machines. I develop the UI, figure out the test sequences for the automated portions of the tests, integrate the various input and output points, both analog and digital. It needs to be as user-friendly as possible so a person with minimal training can feel pretty comfortable using it.

The work I do requires no web programming at all. Everything I do is in Delphi on Windows. Occasionally I have to whip up a small "custom command" in C++ that I then upload into the data acquisition processor board, which is a parallel computer that resides in a PCI slot in the computer; it has its own CPU, memory, and OS.

**It's fascinating to chat with someone who does no web programming at all. That feels pretty unusual today, but I wonder if that's just the signal/noise ratio that I hear about day-to-day rather than a reflection of the industry.**

Yeah, being involved in Exercism has allowed me to see a little bit into how the "other half" lives in the computer industry. I have learned a lot about Test Driven Development (TDD), navigating GitHub, and working on an open source project. A lot of what I have learned has improved the quality of the work I do on the job.

**That's really great to hear. One of the things I love most about Exercism is that "how the other half live" vibe—realizing all your blind-spots and learning about things you had no idea even existed. I imagine being a track maintainer has enhanced that learning even more?**

It has.  I am writing more tests than I use to.  It isn't always TDD per se, sometimes the tests come second instead of first.  However, it has influenced how I structure code, removing unnecessary dependencies to make testing easier.

I spend a lot of time reviewing issues and PRs in the problem-specifications repository, which is where we define Exercism exercises in a language-independent way.  I've learned a lot from the discussions.   Sometimes a suggested change seems straightforward on the surface, but the ensuing conversation uncovers issues.  I've developed more patience. It's taught me to look for other potential angles to technical problems at work.

I've also learned more about mentoring, in particular, the importance of knowing the underlying why as opposed to just the how.  I work with a handful of other programmers. Even though I'm younger than most of them, I've been at the company longer than they have, and I can often point out a more efficient tack to take for sequencing the operation of a machine or explain why something needs to be performed in a particular way.

**Wider than Exercism, you're also a Delphi MVP, which is pretty awesome! How did that come about? Is there a strong Delphi community that you're part of?**

During the initial stages of setting up the Delphi track, I reached out to Mr. Jim McKeeth at Embarcadero to see if we could get an open source license for Delphi. This would permit us to use Delphi to develop new exercises and allow people to contribute via pull requests. Jim invited me to join the Embarcadero MVP Program in the course of our correspondence.

[Delphi Praxis](https://en.delphipraxis.net) is an online community that I am familiar with.  There is a lot of traffic on Google+, but it's on the way out, so we have to go elsewhere.

**Have you built any open source apps in Delphi that others could take a look at?**

I have! [Exercism's Windows CLI Installer](https://github.com/exercism/windows-installer/releases) is open source and written entirely in Delphi. It automatically determines the correct version (32/64 bit) of the Exercism CLI the student needs then downloads the CLI, extracts it, and puts it in the right place. The installer has been downloaded 15,000 times, which I'm pretty proud of!

**That's a fantastic achievement! As someone who doesn't do much (if any) internet programming, what challenges did you face while creating the installer in Delphi?**

The installer was initially written in C#.  It was outdated, and I decided to see if I could improve on it.  I had never attempted anything like this before but knew Delphi had the tools to get the job done.  I started by studying the original C# code to gain an understanding of what sequence of events was taking place behind the scenes and then try to accomplish the same tasks in Delphi.  I found sample code on Embarcadero's documentation site that helped explain how to properly string together the available components for creating a REST client.  I also discovered a handy utility provided with Delphi called REST Debugger.  It allowed me to input and thus test the various HTTP calls that are needed to make the installer successful.  Once they're working the debugger will then create copies of the required components so that I could paste them into the code.

**For someone looking to get deeper into Exercism, maybe someone who hopes to become a maintainer, can you tell us about what your journey was?**

I am a member of a local MeetUp group called the Akron Code Club.  About once a month we meet and usually pair off and work a code kata that has been suggested to the group.  At the August 2016 meetup, we started working exercises provided by Exercism. As I used Exercism and some of the other teaching sites, I thought it would be nice if more of these online programming sites would offer Delphi or Pascal as an option.  After looking around the Exercism site and Exercism GitHub repos, I discovered that Exercism is always interested in adding new language tracks.  I wasn't quite sure how best to contact Katrina.  I think I used Gitter to reach out to her in August '16) proposing the addition of Delphi. I received an apologetic response about two months later—which is when I realized she doesn't Gitter.  Anyway, she wondered if I was still interested in working on adding a Delphi Pascal track and if so would get the ball rolling.

Now there's a repository you can use to request a new language track, and you can always open issues in the exercism/exercism repository to get in touch with the maintainers of the project.

**Great. Thank you for chatting to me, and for all your work on Exercism!**

My pleasure!  This has been fun.  I enjoy taking part and doing what I can for Exercism.  Learning by doing!
