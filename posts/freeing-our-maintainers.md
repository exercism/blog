_TL;DR; We're spending a few months redesigning our volunteering model and giving our key volunteers a break from the work of reviewing community contributions.
If you use Exercism purely to learn or mentor, there’s nothing here you need to know (although please read if you’re interested!). If you are a track maintainer, wish to contribute to Exercism, or wish to report a bug/problem, then consider this essential reading 🙂_

---

Over the last 6 months we’ve spent a lot of time exploring the future of Exercism, imagining what it would look like for every language track to be the best it could be. We’re incredibly proud of what we have built so far. The 85,000 testimonials that have been given speak to the amazing work our community has done in building our language tracks and mentoring so many students through them. Most importantly, we believe we're just scratching the surface of what is possible. We have huge ideas, hopes, and excitement for all that Exercism can be.  But to achieve them, we first need to resolve some fundamental problems that linger under the surface.

Foremost of these is a need to solve the challenge of scaling our volunteer community in a healthy, sustainable way. Exercism has been built on the shoulders of hundreds of dedicated volunteers, but a large proportion of them now feel burnt out and many have left as a result. There’s a myriad of reasons for this, some directly related to Exercism, some down to the time-pressures of life, and some to the backdrop of all that’s happening in the world at the moment. But it’s become very clear to us that we need to design and develop a better way of building our platform together.

We’ve historically tried to build Exercism with an Open Source Software (OSS) model of having maintainers who review contributions from the wider community. This has caused us a lot of problems and caused frustration for both maintainers and contributors. I explore this further below if you want detail, but the TL;DR; is that our key volunteers now spend their time acting as reactive gatekeepers rather than innovative creators. That’s a lot less fun for them, and means Exercism loses the magic those people have previously brought to the platform.

There are two things we need to do to fix this:
1. We need to design a new system of volunteering that suits Exercism better than the traditional OSS model. We’ve spent a good chunk of energy trying to do this so far, and failed. So we’re going to take some time out to work with our volunteers to design this properly over the next few months.
2. We’re going to largely pause wider community contributions for the next few months to let our key volunteers focus on building and developing the tracks in the way they want (or to take a sabbatical if they just want to take a breather!)

My hope is that by taking a step back and really designing this well, alongside fundraising in order to broaden our educational team, we can make Exercism a brilliant place to volunteer, and help secure its future. In the meantime, these changes should mean that the tracks can improve and grow more than they’ve been able to in the last year and that our maintainers stop burning out and instead feel happier, more energised and more connected from working on Exercism.

## Tangible changes

There are three tangible changes that we are implementing.

### Use the Forum, not GitHub Issues

We’re going to free up GitHub entirely for our maintainers to be working on the issues they want to work through. We’ll be closing a wealth of issues that we’ve previously created for the community to work on (and adding a tag so that they can be easily reopened in the future if we want to) whilst not allowing new unsolicited issues or PRs in the majority of repositories. If you’d like to discuss or report something, please use the [forum](https://forum.exercism.org) instead. If you open an unsolicited issue or a PR, it’ll be automatically closed and you’ll be pointed to the forum.

### Pausing wider community contributions

Tracks will be split into three categories:
- The majority of tracks with active maintainers will have community contributions paused, to allow the maintainers to be autonomous or to have a break. (Maintainers of these tracks can request to remove the compulsory one-review requirement. Please speak to Erik on Slack for this)
- Some tracks with active maintainers who actively want to continue to accept community contributions, will remain open (If you’re a maintainer and would rather go into this mode than (1), please reach out to me on Slack to discuss).
- For tracks where there are no active maintainers, track development will essentially be paused for this period.

In all cases, Erik and I will continue to confidence-check PRs to Tooling repos before merge.

### Designing a new volunteering system

We’re going to put together a Community Board to co-design a sustainable, healthy volunteering framework for us moving forward, that unlocks Exercism’s potential. If you’re committed to the future of Exercism and want to be part of this process, please get in touch with [Jonathan](mailto:jonathan@exercism.org).

We’re going to run with these actions for the next few months. We’ll be considering everything throughout the period, and plan to make some new decisions by June 2023. If you’ve any thoughts, please start a topic on the [forum](https://forum.exercism.org)!

## Postfix: Why our OSS model is broken

Our historic model has been built around the OSS model. It’s relied on volunteers who have come into Exercism, done great work on building tracks and then been given maintainer privileges, in which they can then accept contributions from our wider user base to improve them.

While this seems great on paper, it has some significant problems. At the foremost of these is that the people who add the most magic to Exercism end up not having any time to code or create Exercism because their time gets spent responding to community contributions. This is almost never why the maintainers got involved in Exercism in the first place, and not work they enjoy. It’s a little like someone who loves developing being “promoted” to be a team-leader, where they manage people instead of coding. It might seem like a nice promotion at the time, but often it turns out that people don’t enjoy being managers half as much as they enjoy coding.

It also relies on the assumption that the sum of wider community contributions is greater than the individual contribution that a given maintainer could otherwise make. But in Exercism, that’s almost never the case. Exercism is complex, and education is hard, and together they make contributing to Exercism a complex and hard thing to build. There’s loads to learn and understand about both how Exercism works technically and its approach to education, and so this means that most first contributions are people finding their way. This means their initial contributions are relatively small but also that they nearly always need lots of work in reviewing and tweaking. This is time-consuming work for maintainers. In fact, the total time spent in reviewing (as well as the context-shifting required) means the maintainer generally puts more effort into reviewing the PR than if they’d just made it themselves. There are, of course, some exceptions to this, but it’s true in 99% of cases. And frequently this is even more painful to the maintainer as the problem the PR solves was not near the top of their priority list, meaning the things that they know are really essential don’t get done as a result.

Finally, the OSS model relies on contributors starting off small and eventually becoming knowledgeable and regular enough that they can become maintainers. In OSS projects like software libraries, this works relatively well (e.g. someone is using a library in production and keeps adding improvements to it, to the point they eventually have as much knowledge as the original creator). However, for Exercism, that’s just not happened. Despite merging PRs from thousands of contributors in the last 12 months, only a tiny handful have gone on to be regular contributors and even fewer have become maintainers. This is again mainly due to the complexity of Exercism, but also because it’s not a contained piece of software, where this model traditionally work.

All of this is incredibly demoralising for maintainers and detrimental to Exercism.

Tracks have stalled and our core volunteers, who had passion for building, largely lost that passion when their job became that of reviewing others’ work, negotiating competing priorities, and fielding unexpected requests. During the build of v3, maintainers were able to work with relative autonomy as their work was largely behind-the-scenes, which led to a huge level of productivity, and meant the majority of people really enjoyed contributing. Since the launch of v3, despite many volunteers dedicating just as much time to Exercism, it’s been a much less enjoyable and productive period, largely due to how much energy has gone into responding to others’ contributions or issues. Our volunteers now spend their time acting as reactive gatekeepers rather than innovators, and that’s a lot less fun.

These are the challenges we need to fix, and they’re hard ones. We need to find a way for people who want to spend hundreds of hours building Exercism’s language tracks to be able to do that and love doing it. We need to find a way for bug fixes and small contributions to get into our codebase without those key volunteers’ attention. And we need to find a way to entice new volunteers into Exercism, and support them should they choose to commit to ongoing contributions. We need to reduce gatekeeping in general while also respecting that those who have put so much effort into tracks have strong and very well considered opinions. We need to make it fun to manage and run that whole volunteering setup. And we need to solve a host of other things as well. It’s going to take time, and be a challenge, but when we pull it off, it’ll be amazing.

