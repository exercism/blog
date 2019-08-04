It’s been just over 12 months since we launched the new version of Exercism, rethinking it from the ground-up, introducing the concepts of progression and formal mentoring.

Our plan at launching v2 was to respond quickly to anything that was broken or missing - either in terms of software or conceptually - and then to take our time watching and learning how everyone used the new version. We’ve now come to the end of this phase and are now ready to start taking the next steps and invest some serious energy into Exercism based on everything we’ve observed over the last year. In this post I want to outline where we feel Exercism has got to - the good and the painful - and what we want to improve over the next few months.

## The Good

Since we launched v2 in July 2019, we’ve had 133,823 new members sign up, 578,464 iterations submitted and 294,504 comments posted. We’ve had over 2,500 people sign up as mentors and 75,000 posts written by them in our Slack Workspace. All of that growth and activity has come about purely by word of mouth - by our community raising awareness of what we’re doing, and supporting and encouraging each other. That’s something we’re incredibly excited about and exceptionally grateful for.

Thanks to our community of maintainers, our language tracks have continued to improve on a daily basis, and in a few tracks we’ve made huge steps forward thanks to the work of the Track Anatomy Project. We now have 3,085 exercises spread over 50 active tracks.

A few months ago, with the support of Mozilla, we launched automated analysis of solutions. Our community have now built analyzers for 10 languages and we’ve now analysed 14,000 solutions and approved over 4,000 of them automatically, saving our mentors ~350hrs of effort.

## The Painful

Beyond some early teething issues, there has been one real pain point over the last 12 months, and that has been large response times for mentoring, and subsequently the large backlogs that build up in some tracks. This is something we always knew would be a teething pain point, and something we’ve spent a lot of time addressing over the year. The challenges around this can be broken into three main categories:

- **Track structure:** Unless tracks have a smooth progression pathway with a set core exercises that teach one topic each and are relatively easily to give feedback on, mentoring-time per exercise rockets, and tensions increase dramatically between mentors and students.
- **Mentoring must be rewarding:** Mentoring is interesting when feedback is personal, and conversations are bespoke to a student’s understanding, and as a consequence it is boring when giving the same feedback over and over.
- **A lack of sense of community:** The tracks that have had the best mentor engagement and retention almost always have a handful of key mentors who have supported and encouraged each other through our Slack Workspace. Without that community, mentoring can be lonely and the drop-off rate is substantial. Relationships between students and mentors is also key to this sense of community - having respectful and personalised interactions between people make this feel like a sense of humans helping humans, not purely an education website.

## The next 12 months.

### Restructure tracks for student enjoyment and ease of mentoring

We have been working on the [Track Anatomy Project](https://exercism.io/blog/track-anatomy-project) for the last few months. That has been critical in fixing some of the immediate problems of Tracks on Exercism. It’s also become clear to us that lots of different maintainers and mentors have different ideas on how Tracks on Exercism should look and what it means to learn a new language. Over the next 12 months, we intend to focus significantly on questions like "What does it mean to gain fluency in a specific programming language?" and "How does my existing background effect what I need to learn/unlearn to program in X?" We want to explore how Exercism can evolve to better focus on our goal of teaching fluency, and we want to ensure that we apply proper product-work to tracks on Exercism.

### Automate the automatable

We are now automatically approving solutions and providing feedback in 10 languages. Over the next few months we intend to expand this both in terms of languages and exercises and also in terms of functionality - providing feedback when we don’t approve solutions, and better incorporating automated analysis into students’ and mentors’ experience on Exercism. We will also be adding the automated running of tests in the next quarter - an important step in speeding up analysis development and giving mentors a clearer understanding of a student’s submission. We believe this will have the following benefits:

- **Reduce student frustration:** We want to give students a quick feedback loop. If a solution is optimal, let them continue. If it fails in an anticipated way, tell them and let them improve it. This prevents students from becoming frustrated waiting for their perfectly-fine solutions to be approved, reducing the perception of mentors being slow, which causes a less enjoyable interaction.

- **Dramatically reduce the size of the queue:** Our prototyping has shown that for simple exercises (e.g. TwoFer) we will be able to provide automated mentoring in 90%+ of cases. For more complex exercises, the percentage will be smaller but we expect to be able to provide automated mentoring on 50% of exercises, and on all optimal, or close-to-optimal, solutions.

- **Removes repetitiveness for mentors:** As most solutions fall into similar buckets, mentoring often turns into a copy and paste process, with a canned answer for each class of solution. This is boring and uninteresting to all but the most determined of mentors. By removing common solutions from the mentor queue, mentors will be able to focus solely on students who need something extra or have a fundamental learning gap that we cannot see.

### Encourage respectful relationships between students and mentors

Mentoring on Exercism is currently a very transactional process. A student submits a solution and a mentor gives comments. Other than the generally friendly nature of conversations there is no "relationship" between the mentor and the learner. There is no easy way for a mentor to remember if they have given feedback to that student before. There is no way to know if a student is a beginner or an experienced programmer and tailor feedback accordingly. There is no way for a student to know their mentor's background and respect/appreciate the feedback in that context.

By providing better information, and integrated profiles for both mentors and learners within the user interface, we can make the whole experience more empathetic, making mentoring more rewarding and enjoyable.

We also intend to explore the idea of allowing pairings students and mentors, enabling students to continue to learn from mentors they find particularly helpful, and providing less transaction, more rewarding interactions to mentors. We believe this will increase the enjoyment of value of Exercism, and also speak more to mentors’ intrinsic motivations of helping others and therefore increase mentor retention.

### Turn our userbase into a community

The tracks that "work", work because they have 2-5 key "ever-present" mentors. These are the "parents" of the track. They advise others, improve the mentor notes, welcome new people, answer their questions, and generally make the mentors feel part of something. Once a track gets one key mentor who is comfortable being that voice on Slack, the track’s backlog tends to quickly reduce. And momentum is key. When it feels like the backlog is going down, everyone jumps on board and helps. Then everyone wants to keep the backlog low.

Those mentors who mentor the most regularly are also the most active on our Slack community. We believe this is because they feel the most connected to Exercism, the most supported, and because mentoring becomes more than just replying to students - it becomes about sharing in bigger goals with other like-minded people.

We are convinced that the fundamental blocker for Exercism’s growth and success is not a technological one, it’s a people one. Our focus needs to be on considering Exercism not as a website or product, but as a community - a place where people can gift their time to helping others. Exercism offers people the opportunities of connection, community, purpose, kindness, but we currently do not harness or encourage this well.

A large focus for us over the next 12 months will be working out how to improve this - how to make Exercism feel like a community not like a website, without watering down the functional reality of learning and mentoring. We do not want to be a "social network" or an unfocussed forum for discussion - but we do want people involved in Exercism to feel connected to the other thousands of people who are also using it. Getting this right is complicated and will be a slow and careful process.

Once we feel we have this right, we will also lower the barrier to mentoring on Exercism, making it easier for anyone to help others, knowing that there is a strong community there to support and moderate what is happening within the site.

### Extrinsic motivations / progressing in Exercism

In designing v2, we made a very deliberate decision to keep Exercism centered around intrinsic motivations and to avoid any sort of gamification. While we still think it’s essential that Exercism is centered around people doing things for the right reasons, there are things that have made us question the "exclusivity" of intrinsic motivation in our model.

Mentors burn out after a while. Things become repetitive - they have their fair share of difficult students, and they take a break. Sometimes permanently.

Those who stay the most active are those who get new challenges. People who maintain, mentor, contribute on Slack, do the Track Anatomy project, build an analyzer, write a blog post etc. Those people are consistently finding new ways to keep Exercism interesting for them. If you don’t actively go out seeking things to do (which has generally meant befriending one of the core team on Slack) there is no progression or newness for people. There is nothing to unlock, no structures to move through. For all the work we put into adding a sense of progression and unexpected reward for students, we have nothing similar for mentors, and I think this is a real loss.

Those people who are amazing get no recognition for it. If you get mentored by a seasoned well-respected mentor, you should know it. If you are that mentor, and you’ve done amazing things for Exercism, right now no-one knows and you can’t use that in your "real-world" life.

We want to explore ways to provide opportunities for our community to have new challenges, opportunities and privileges the more they use Exercism. We are going to spend time asking what things can we add that would be valuable to Exercism and valuable to people within our community, while not detracting from the intrinsic motivations that must continue to power Exercism. While we want to tread carefully in getting this right, we feel strongly that getting it right will make a huge difference to Exercism. This is something we will experiment with, and build on month-by-month over the next 12 months.

### Shouting about being us

The final area we want to work on over the next year, and the final big gap we think exists at the moment, is better communicating what Exercism is about, who we are, and what we’re trying to do. When people assess if they want to give their time to Exercism, they’re going to assess us on our values, and principles and their experience of us outside of Exercism itself. 

So we need to shout about our vision, shout about who we are, what we believe in. We need to be constantly reinforcing the vision to everyone in the community, getting excited together about all we can achieve with Exercism. We need pages that talk and excite, and videos that feel like there’s people behind the text. Our aim in this is strictly not to try and acquire users - it’s to be clear about who we are and to keep people excited and motivated to be part of us. It will probably mean we do grow faster and gain more momentum, but that’s not what we want to be measuring or caring about. We want to care about everyone associated with Exercism feeling excited, empowered, and connected.

We have started doing small bits of this just by being more accurate on social media, and already that has started to build more excitement and connectedness among members of our community, and helped promote our "brand" as a positive one. We intend to carefully build on this over the next year, and make Exercism a place that everyone involved is proud to be associated with.

## In conclusion

We are **really** excited by the next twelve months, about how we can help Exercism take the next steps to reaching its potential, and about how we can better serve and connect our community. I want to finish by saying a huge thank you to everyone that’s contributed ove the last year, whether as a maintainer, mentor, student, or in some other way. Thank you for your excitement, ideas, contributions and patience as we continue to improve things.

_Note that Exercism has a [strategy document](https://exercism.io/strategy) which we keep updated with our plan for how to take Exercism forward, and which you might like to keep an eye on in the future._

