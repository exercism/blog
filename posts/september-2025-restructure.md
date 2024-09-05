# September 2025 Restructure

Hi everyone!

Last week we hit the huge milestone of two million users. 
Within a few hours, we also hit 45 million exercise submissions.

A day later, I paid the final payroll for me, Erik and Aron, and our bank account reduced down to the point we can't afford to pay another.

I think this sums up Exercism's story pretty well.
Over 1,200 people per day sign up to Exercism.
Tens of thousands solve exercises each day.
But we don't have enough money to continue to work on the platform.

We've tried a lot of things to change that. 
We've spoken to hundreds of funders and companies, but Exercism isn't the right fit for their support.
It doesn't fit a niche that makes sense for them.
By serving people everywhere, it seems we don't serve a narrow enough demographic that we align to funders' often narrow missions!

The one area we have had some promising success is in advertising on the site.
But the effort it takes to find advertisers and manage them, and my general desire not to flood Exercism with adverts, has meant that I feel this isn't a very sustainable strategy.

I think it's fair to say that at this stage I've lost faith in the nonprofit buisness model working in a way that allows Exercism to reach any of its potential.
Keeping something free for everyone relies on either the user being the product, or on significant donations, and without either, it's very hard to grow.

## Erik + OSS Restructure

Probably the hardest thing about the situation right now, is that we can no longer afford to pay Erik, so he's leaving as an employee at the end of this week.

Erik has been an absolute critical part of Exercism's growth and success over the last few years.
He's also been a wonderful colleague and friend, and I'll really miss working alongside him.
It goes without saying that I'm incredbily grateful to Erik for all his hard work and support.
And I know many of you will feel the same (if so, please reach out and tell him!)

Erik's a die-hard Exercism fan, and he's going to continue as a senior maintainer of a few tracks, and he'll hold onto his super-admin priviledges, but the plethera of hidden (and often a bit boring) things that he does day-to-day need to get spread across the organisation.

The one key thing we're enforcing is that every PR in a live Exercism repository should get a review before it can be merged (with only one exception outlined below). 
This has generally been the case anyway for a long time, but there are places where it's fallen through the cracks, so we've now scripted things to ensure this is always the case.

To do this, we've come up with some new classifications system for repos, and specific rules for each type:
- `maintained`: A repo that has multiple maintainers. All PRs require reviews from a track maintainer.
- `maintained-solitary`: A repo that has one maintainer. A new cross-track-maintainers team will get pinged to review all PRs.
- `unmaintained`: A repo that has no maintainers. The cross-track-maintainers team will get pinged here too.
- `maintained-autonomous`: A repo where all maintainers are also in the cross-track-maintainer team. This is the exception, where they can merge their own PRs.
- `wip-track`: An unlaunched track. As it's not "live" yet, it doesn't have restrictions.

We've created two new GitHub teams that enforce this.
- `@exercism/guardians`: A team to check the safety of PRs to tooling repositories (test runners, analyzers, etc). Made up of a few longstanding polyglots.
- `@exercism/cross-track-maintainers`: A new team made up of longstanding polyglots who are active on the site on a day-to-day basis, and who have the same level of reviewing-pedanticism that I do (ie they're not more strict or more flexible than me). This is important, as I want a consistent, responsive experience from this team.

Both teams are invite-only.
I'll review them sporadically.

We've also "pruned" a lot of inactive maintainers as part of this. 
To those people who have been pruned - thank you for all you've done, and please know you're very welcome back if you find the time/desire to contribute in earnest to Exercism again!

## So what's next?

So this has all been a bit gloom and doom so far. 
Things don't always go as you hope in life, but you have to make lemonade from the lemons!

Right now, we have about 800 monthly donors and about $7,500 in monthly donations.
That covers our server costs pretty much exactly. 
So if you're donating right now, thank you. 
You are literally keeping our servers on.
Our donor base is generally quite stable, so I'm not too worried about Exercism's existential prospects.

For the last few months, I've been working on a new educational product teaching coding fundamentals that I'm going to launch in 2025.
96% of people who try to learn coding give up - which I find unacceptable, so I'm aiming to change that.
My plan is to give beginners a rock-solid base, then funnel them into Exercism.
I'm creating a new for-profit company for the new company, and going to use proceeds from that to keep Exercism growing.
I've raised a little investment for this, which means Aron I can continue to pay Aron's salary, so he'll be staying around, working on that with me, and tweaking Exercism as needed.

I'm also planning (probably 90% certain) of running a dedicated learn-to-code course from Jan-March 2025, where I can test out some of what we've been building, and I can get my hands dirty working with the students who existing platforms don't serve. 
So keep out for an announcement about this soon.

I'm exploring launching a basic version of Exercism Teams, as a way of making some extra revenue. 
There's [a forum post](https://forum.exercism.org/t/exercism-teams-coming-soon/12667) here where you can leave thoughts. 
I'd really appreciate any you have!

But first, I need a breather. 
I'll be taking the next two weeks off, unplugging and recovering a little.

Thanks for all your support - emotional and financial. 
Exercism's community is phenominal and I'm deeply grateful to everyone involved in the project.