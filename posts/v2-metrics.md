A couple of weeks ago I posted an issue about our upcoming journey towards Exercism V3. Someone [posted a comment](https://github.com/exercism/exercism/issues/5135#issuecomment-566125777) saying that they hoped the transition would be smoother than V1 to V2, and questioning whether a lot of changes we made were worth the hassle. Both are excellent points to raise, and show that we've clearly not explained the impact that the V2 changes **did** have and why we believe they were worth it. I thought it would therefore be worth writing a short post outlining the changes we saw in the data, and also the metrics that we're targeting with the push to V3.

Two notes. Firstly, the metrics below are roughly ordered by the flow of the site, rather than of importance. Secondly, I've used a 17 month window either side of the launch of V2 for comparisons. When I say "V1", I mean the final 17 months of V1. There's no perfectly accurate way to do this, as V1 had many small changes in the 17 months prior to launch, and V2 had substantial improvements over the period since it launched. We also have outlier days, like the one during V1 when GitHub featured us and we had 30x traffic for a day or so. I've not worried about that and just stuck to a fixed window either side, believing it to be the fairest way to measure things.

## V1 -> V2 Metrics

### Visitors signing up (Branding)

One of our aims was to make Exercism feel more welcoming to people who might have been put off by the original (red + devil) branding. To many, this seemed like a minor change, because they **weren't** put off by the branding and so the effort seemed like a waste of time. However, we believed that Exercism didn't exude "welcoming inclusive community" in V1, and it was important for us to put that right.

How many people signed up to Exercism over the periods, and what was this as a percentage of new visitors?

V1: 62,618 (17% of new visitors sign up)
V2: 188,844 (48% of new visitors sign up)

This first change was substantial. Our V2 landing page converts at 48% as opposed to 17% for V1. That's pretty much purely down to brand and clarity over what we do and who we are. So I strongly believe that the effort that went into rebranding Exercism was worth the effort.

One caveat is that V2 probably encourages people to sign up who aren't yet ready for Exercism as it stands. V2 isn't set up for total beginners, yet the landing page for V2 is much more welcoming for total beginners, so we probably get a lot of users who aren't yet ready for Exercism. One way to account for this would be to consider not only the number of visitors signing up, but rather how many visitors signed up _and_ managed to submit a solution. For this we see:

V1: 26,194 (7% new visitors sign up and submit)
V2: 52,533 (13.9% new visitors sign up and submit)

So from this we can say that the branding has accounted for approximately a doubling of our true "conversion rate", which makes the rebranding effort definitely worthwhile. It's also worth noting that as we move forward to being beginner friendly (V3.x) this caveat will go away altogether.

### Solutions getting feedback (Mentoring)

The second thing we wanted to improve was the amount of mentoring per solution. In V1 it was a bit of a lottery - you might get comments or you might not, purely dependent on whether someone noticed your submission. A big part of the formal mentoring of V2 was about making this fairer, consistent and reliable.

The metric I've used here is _comments per solution_.

V1: 3.5% of all solutions
V2: 64% of solutions where mentoring has been requested (26% of all solutions)

This is the phenominal statistic in my eyes, and the big indicator that V2 took us in the right direction. You're now 18x more likely to recieve feedback on your solution in V2 than in V1. There's a lot we got wrong with mentoring in V2 (see the next section!) but I feel hugely proud and grateful to our mentors for the fact that Exercism offers a place where if you want mentoring, you'll more likely than not recieve it.

### Stickiness

Finally, we wanted to improve "stickiness" - the amount of usage of the site. If people are enjoying Exercism and finding it useful, they'll do more with it. There are two sides to this, the amount of times someone comes back to the site, and the amount of solutions someone uploads.

V1: 4.79 sessions / person
V2: 5.42 sessions / person

V1: 8.0 solutions / person
V2: 8.2 solutions / person

Both held pretty much steady. This is one area where I hoped we'd see a big increase in V2 and we didn't. The wait times for mentoring, and the blocking mechanisms that stop progression without mentoring both made V2 a very slow experience. For someone wanting to get stuck into a language, with the huge mentor queues we often saw, it became difficult to learn at a reasonable rate. The experience here will be very track-dependent. For tracks with wait times longer than a day, the dropout rate is noticeable. For those with longer wait times (e.g. Rust, Python), the dropout rate is substantial.

The changes in V3 are largely aimed at fixing this problem - making Exercism a place where you can quickly learn or practice a language, but where you can also have asynchronous helpful conversations with mentors without having your progress blocked.

## Moving towards V3.

For V3 I hope to see all three of these metrics continue to rise. My aim is that people hear about Exercism and sign up, that they manage to submit solutions and get deep into tracks without feeling frustrated, and that when they want mentoring they receive it.

I hope that the statistics above demonstrate that we're moving in the right direction and that the work everyone has put into V2 has been worthwhile. There's going to be a lot of effort needed from the community to get us to V3, but I'm confident that when we take stock of Exercism 24 months from now, we will be seeing similar increases and that all of the next phase of work will prove worthwhile. Exercism **is** our community - thank you all for everything you do.
