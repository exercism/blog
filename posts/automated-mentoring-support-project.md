_Update: We're excited to announce that Mozilla have awarded us an Open Source Support Award for this project. You can [read more here](https://exercism.io/blog/mozilla-supports-exercism-static-analysis)._

This blog post marks the start of [Exercism's](https://exercism.io) **Automated Mentoring Support Project**, in which we will develop a framework that programmatically analyzes users' solutions in order to improve the feedback loop for learners and reduce the burden for mentors. Our aim in the short term is to automatically approve solutions that meet given acceptance criteria and provide feedback for commonly-seen improvements.

The purpose of this post is to describe the problem we're trying to solve and the high-level plan for how we'll be tackling it over the next few months. We'll be following up with further posts which dig into the background of the problem and the history of automated analysis on Exercism, as well as more details about our implementation strategy.

## Why automated mentor support?

Exercism's most significant barrier is being able to deal with scale.

Our volunteer-mentors are crucial to Exercism’s success. They are responsible for reviewing learner’s solutions, analyzing whether they meet the success criteria of the exercise or need to be improved, empathetically understanding a learner’s thought process, providing encouraging and helpful feedback, and coaching people in a language’s idioms. Today, we are just about managing to keep up with the mentoring demand. If we want to grow, we need a better strategy than "add more mentors."

For the core exercises that form the spine of an Exercism language track, we estimate that about 25% of submissions are good enough to be marked as complete on a first attempt. A further 55% of submissions have problems that fall into common buckets, which can be mentored by copy/pasting feedback snippets. Only about 20% of solutions require a mentor to be inventive and thoughtful in their feedback.

The 80% of solutions that do not genuinely engage a mentor’s brain are a frustrating time-sink for people who are willing to volunteer their time helping others, and do not make the most of their expertise.

Similarly, a learner might wait anywhere between a day and a week before receiving feedback and is unable to move forward on the track in the interim. For those who have submitted an iteration that falls within the 25% of perfectly valid solutions, this delay is exceptionally frustrating. To the remainder, it is suboptimal at best. Learners often lose momentum due to this delay and become frustrated at the process.

By developing a system that can automatically analyze a solution and either approve it or provide stock feedback to known issues, we estimate we will be able to dramatically reduce mentors' workload by eliminating the "boring" parts, while significantly improving a learner's experience. As an added bonus, people will receive more consistent feedback when it comes to structural and stylistic questions, which sets them up to have more interesting conversations about the less clear-cut topics.

## How will it work?

Our long-term goal is to develop deep-learning algorithms that can analyze the Abstract Syntax Trees (ASTs) of the nearly one million submissions that have been submitted since Exercism first launched in 2013. Such a tool might detect common patterns and related comments by mentors. In the near term, our goal is to use  [static analysis](https://en.wikipedia.org/wiki/Static_program_analysis) to determine what feedback can be given based on the most commonly repeated errors seen by mentors.

The project breaks down into roughly the following areas:
1) **Product changes:** We need to work out how this automated analysis fits with the current mentoring UI, how we communicate this feedback (system messages, a "bot," etc.), and then implement this for the Exercism website.
2) **Infrastructure:** We will design and build infrastructure that can efficiently support running static analysis across multiple languages.
3) **Static analysis prototype:** Develop a sample analyzer that will auto-approve good solutions to Ruby / Two-fer, and document this process so that the wider community can contribute.

We aim to launch the initial prototype by mid-2019. Once we have the foundations in place, we expect to extend this to other languages than Ruby, and other exercises than Two Fer. While we won't have the framework in place to integrate other languages and exercises into the website until we've made progress on the prototype, if you want to start writing analyzers for your favorite languages and exercises, there's no reason to wait! Open an issue on [the GitHub repo for this project](https://github.com/exercism/automated-mentoring-support) and tell us what you're interested in doing.

We are very excited to work with others in the Exercism community who have already been using static analysis to help with mentoring, such as
 [tehsphinx](https://exercism.io/profiles/tehsphinx) and [bitfield](https://exercism.io/profiles/bitfield) who have developed a [static analysis tool](https://github.com/tehsphinx/exalysis) for mentors on the Go track. The way that it has taken the track from having a massive backlog to being one of the most responsive language tracks on Exercism shows how impactful automated mentor support can be.

Over the next few weeks, we'll be outlining more about these first key steps and how things will work.

We'd love to answer any of your questions in the comments section below! :)
