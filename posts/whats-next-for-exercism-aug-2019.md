Just over 12 months ago, we launched the new version of Exercism. It was a radical change, rethinking the product from the ground up, and introducing the concepts of progression and formal mentoring.

Since the launch, we've fixed anything that was broken and added some things that we had conceptually missed, but have mainly watched and learnt how everyone has used the new version. This post outlines what the past twelve months have taught us — the good and the painful. It also lays out what we hope to achieve in the next few months.

## The Good

Exercism has experienced a tremendous amount of growth, purely by word of mouth. Since July 2018, 134,000 new members have joined. We've seen 578,000 submitted iterations, and 395,000 posted comments and over 2,500 people signed up as mentors, writing 75,000 posts to each other in our Slack Workspace. The community has supported and encouraged each other, and this has allowed Exercism to thrive. We are incredibly excited and exceptionally grateful for this.

Thanks to our community of maintainers, our language tracks have continued to improve daily. In a few tracks, we've made huge steps forward thanks to the work of the Track Anatomy Project. We now have over 3,000 exercises spread over 50 active tracks.

With the support of Mozilla, we've implemented automated analysis of solutions. Our community has built analyzers for ten languages and we've analyzed 14,000 solutions since launching. The analysis has allowed us to approve 4,000 submissions automatically, saving our mentors about 350 hours of effort.

## The Painful

Beyond some early teething issues, there has been one major pain point over the last 12 months: large response times for mentoring, which has meant significant backlogs have built up in some tracks. The challenges inherent in the mentoring delays fall into three main categories:

- **Track structure:** When tracks don't have a smooth progression pathway, mentoring becomes much more difficult, mentoring-time per exercise rockets and tensions increase dramatically between mentors and students. Few tracks had a set of core exercises that built on each other at launch.
- **Mentoring must be rewarding:** Giving the same feedback over and over is boring. Mentoring becomes interesting when feedback is personal, and conversations are bespoke to a student's understanding.
- **A lack of sense of community:** When mentoring becomes lonely, the drop-off rate is substantial. In tracks where there are a handful of key mentors who support and encourage each other through our Slack workspace, mentors tend to stick around. Relationships between students and mentors are also key to this sense of community. Respectful and personalized interactions between people provide a sense of humans helping humans, not purely an education website.

We've spent a lot of time addressing these challenges over the past year, and a huge amount of behind-the-scenes energy trying to understand the core issues at their heart. Our plan for the next 12 months aims to solve these three issues. We hope at the end of this period to have fast and consistent response times across all tracks.

## The next 12 months.

Our work for the next 12 months is broken into several sections. This list is not exhaustive — we will, for example, continue to fix bugs and add more general tweaks to the website and CLI — but it will form the focus of our work.

### Restructure tracks for student enjoyment and ease of mentoring

The [Track Anatomy Project](https://exercism.io/blog/track-anatomy-project) has been critical in fixing some of the immediate problems of tracks on Exercism. Over the next 12 months, we will explore more in-depth questions about fluency, learning, and unlearning, and dig into what is unique or particularly challenging about different languages.

### Automate the automatable

We are now [automatically approving solutions](https://exercism.io/blog/automated-mentoring-support-project) in ten tracks. For these solutions we also provide automated tips for improvement.

We will expand existing analyzers to handle more exercises, and add analyzers for other languages. We also want to better incorporate the analysis into the students' and mentors' experience on the site, in particular by identifying and reporting common problems that prevent automated approval.

We will start running the test suites against submitted solutions.

We believe this additional automation will have the following benefits:

- **Reduce student frustration:** We want to give students a quick feedback loop. If a solution is optimal, let them continue. If it fails predictably, tell them so they can improve it.

- **Dramatically reduce queue size:** Our prototyping has shown that for simple exercises we can provide automated mentoring in over 90% of cases. While we expect that number to be smaller on more complex exercises, we think we can provide automated mentoring on about half of the submitted solutions.

- **Removes repetitiveness for mentors:** Most solutions fall into similar buckets. A lot of mentoring relies on copy/pasting canned answers for each class of solution, which is tedious and uninteresting even to the most determined of mentors. Removing common solutions from the mentor queue will allow mentors to focus on the cases that require their knowledge and experience.

### Encourage respectful relationships between students and mentors

Mentoring on Exercism is currently a very transactional process. A student submits a solution, and a mentor gives comments. Other than the generally friendly nature of conversations, there is no "relationship" between the mentor and the learner. There is no easy way for a mentor to remember if they have given feedback to that student before. There is no way to know if a student is a beginner or an experienced programmer and tailor feedback accordingly. There is no way for a student to know their mentor's background and respect/appreciate the feedback in that context.

We will explore two things that we hope will make the whole experience more empathetic, making mentoring more rewarding and enjoyable.

The first is more in-depth profiles for both learners and mentors, with much tighter integration into the mentoring experience.

The second is the idea of student-mentor pairings. This would enable students to continue to learn from mentors they find particularly helpful, and mentors to work with students whose learning style or background they understand well.

### Turn our userbase into a community

When tracks "work," they work because they have a small number of ever-present mentors. These mentors advise others, improve the mentor notes, welcome new people, answer their questions, and generally make people feel part of something. Once a track gets one key mentor who is comfortable being that voice on Slack, the track's backlog tends to reduce quickly. This momentum is key. When it feels like the backlog is going down, everyone jumps on board and helps. Then everyone wants to keep the backlog low.

Those mentors who mentor the most regularly are also the most active on our Slack community. We believe this is because they feel the most connected to Exercism,  and the most supported. Mentoring becomes more than just replying to students—it becomes about sharing in bigger goals with other like-minded people.

We are convinced that the fundamental blocker for Exercism's growth and success is not a technological one, it's a people one. Our focus needs to be on considering Exercism not as a website or product, but as a community—a place where people can gift their time to helping others. Exercism offers people the opportunities of connection, community, purpose, kindness, but we currently do not harness or encourage this well.

Over the next 12 months we will be working out how to make Exercism feel like a community rather than a website. We don't want to water down the functional reality of learning and mentoring. We don't want to be a "social network" or an unfocussed forum for discussion. We want people involved in Exercism to feel connected to the other thousands of people who are also using it. Getting this right is complicated and will be a slow and careful process.

Once we get this right, we will lower the barrier to mentoring on Exercism. We will make it easier for anyone to help others, knowing that there is a strong community there to support and moderate what is happening within the site.

### Add extra motivation to contribute

In designing v2, we made a very deliberate decision to continue to avoid gamification. We think it is essential that people participate because they find intrinsic value, not because we tickle their reward centers artificially.

The people who remain active are those who continuously challenge themselves in new ways within Exercism's ecosystem. Whether it's maintaining a track, mentoring a new language, writing blog posts, or building analyzers, they keep finding new ways to keep things interesting. For all the work we put into adding a sense of progression and unexpected reward for students, we have nothing similar for mentors, and I think this is a real loss.

Also, we want people's hard work and amazing contributions to be recognized and celebrated.

We want to explore ways to provide opportunities for our community to have new challenges, opportunities and privileges the more they use Exercism. We are going to spend time asking what things can we add that would be valuable to Exercism and valuable to people within our community, while not detracting from the intrinsic motivations that must continue to power Exercism. 

We will tread carefully to get this right, and we feel strongly that getting it right will make a tremendous difference to Exercism.

### Shouting about being us

The final area we want to work on over the next year, and the final big gap we think exists at the moment, is better communicating what Exercism is about, who we are, and what we're trying to do. When people assess if they want to give their time to Exercism, they're going to evaluate us on our values, and principles and their experience of us outside of Exercism itself. 

So we need to shout about our vision, shout about who we are, what we believe in. We need to be constantly reinforcing the vision to everyone in the community, getting excited together about all we can achieve with Exercism. We need pages that talk and excite, and videos that feel like there's people behind the text. Our aim in this is strictly not to try and acquire users - it's to be clear about who we are and to keep people excited and motivated to be part of us. It will probably mean we do grow faster and gain more momentum, but that's not what we want to be measuring or caring about. We want to care about everyone associated with Exercism feeling excited, empowered, and connected.

We have started doing small bits of this just by being more accurate on social media, and already that has started to build more excitement and connectedness among members of our community, and helped promote our "brand" as a positive one. We intend to carefully build on this over the next year, and make Exercism a place that everyone involved is proud to be associated with.

## In conclusion

We are **really** excited by the next twelve months, about how we can help Exercism take the next steps to reaching its potential, and about how we can better serve and connect our community. I want to finish by saying a huge thank you to everyone that's contributed over the last year, whether as a maintainer, mentor, student, or in some other way. Thank you for your excitement, ideas, contributions and patience as we continue to improve things.

_Note that Exercism has a [strategy document](https://exercism.io/strategy) which we keep updated with our plan for how to take Exercism forward, and which you might like to keep an eye on in the future._
