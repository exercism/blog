As we discussed in our [blog post last month](https://exercism.io/blog/whats-next-for-exercism-aug-2019), one of our key goals for the next year is to restructure tracks for both student enjoyment and ease of mentoring. We've made huge progress with this over the last year with the Track Anatomy project spearheaded by Maud de Vries, and out of this we've identified some fundamental problems with how tracks are structured, which we believe need addressing as a priority. Over the last two months, the leadership team have been discussing how we should approach this, and what needs to happen to bring our tracks into the necessary state to offer idiomatic learning of different languages in a timely manner.

Today, I'm really excited to announce that we are launching a project in association with James Evans and Gary Lupyan from The University of Chicago, sponsored by the Sloan Foundation, which will allow us to put some serious focus and energy into rethinking Exercism's tracks from the ground up, and executing those changes in a number of languages. In addition, I'm delighted to announce that we've hired [Erik Schierboom](https://www.erikschierboom.com/about/) to lead the project.

### Background

For the last two years, James and Gary have been investigating how the languages that a programmer uses affects their efficiency, creativity, and collaboration. Supported by [a grant from the Sloan Foundation](https://sloan.org/grant-detail/8001) they have determined that a crucial part of this research is understanding how programmers learn different languages, and how one's existing knowledge helps or hinders new learning. This is the exact question that we have been asking ourselves with regards to language tracks on Exercism. How does someone's previous experience affect the pathways they need in our tracks and the style and substance of mentoring they respond best to?

James, Gary, and The Sloan Foundation have decided to invest some of their resources into enabling Exercism to focus energy into redesigning our tracks to become more focused on a language's uniquenesses and to become more personalised based on the student's existing experience.

### The Project

We will be blogging much more about this in the coming weeks and months, but I want to outline the main aims that we're hoping to achieve with this project, and how they will affect Exercism.

**Rethinking the cores of Tracks:** Our tracks aim to teach programming languages, not programming itself. We intend to encode this into our tracks, rethinking our core pathways to focus them around, specifically teaching the idioms that make a language unique. We intend to design and develop new exercises that specifically focused on one idiom each. For example, in Ruby, we might have an exercise that teaches enumeration rather than looping, or in JavaScript the concept of Prototypes or Binding.

**Develop comprehensive automated-analysis coverage of core exercises:** We want a student to be able to pass through the core of a track rapidly. In designing exercises, we will deliberately focus on how we can provide 95% automated analysis coverage to the possible solutions. This means that the interactions that mentors have will be with the 5% of students that really need their help, or on more interesting and varied side exercises. As part of this, we want to develop tools that enable our mentors to contribute to the automated analysers without having to dig into the codebase.

**Offer bespoke automated mentoring and mentoring hints based on previous experience:** Once we have completed the previous steps, we want to explore tailoring the feedback that a student gets to their previous experience, either in terms of the automated responses they receive or in terms of hints we give to mentors. The feedback someone needs when learning a specific language depends heavily on their previous knowledge. Their anchor points are different, and their preexisting knowledge might be harder to unlearn, so by considering someone's previous experience, we can offer a personalised and more useful experience for students.

**Adding in-browser coding support:** In parallel to the rethinking of core tracks, we are going to add one of our most-requested features: the ability to solve exercises in the browser. This will not replace using the CLI, which we believe is an incredibly valuable way to learn, but will offer people the ability to quickly try and explore languages without having to install that language and its tooling.

### The Funding

The funding we are receiving from The Sloan Foundation via James and Gary will allow Jeremy, Nicole, Charles and Karlo to invest most of their time for the next 12 months into the product work, development work, and architecture required to achieve the aims above.

It will also allow us to hire Erik to lead on the "curriculum" side of the project. Erik has been a significant contributor to Exercism since 2016, maintaining the C#, F# and Scala tracks, building analysers, designing exercises, contributing to project-specifications and mentoring. He is also passionate about programming languages and has completed a significant proportion of the tracks on Exercism. He is also crucially someone who is universally liked and respected amongst the Exercism community, and therefore perfectly positioned to help navigate us through understanding how we can design tracks and systems that allow the differences and similarities of 50 different programming languages to shine through.

### Getting involved

We will be putting together a specific team to help with this project. This team will be responsible for defining the idioms across tracks, designing new core exercises, helping us design frameworks and standards for analyzers, and thinking through how incumbent knowledge affects learning.  Although, as with the rest of Exercism, this will mainly be volunteer work, we do hope to have some funding left over to pay people to work on sprints for certain areas of this project that are not normally done by volunteers.

If you are an experienced mentor **and** maintainer and you'd like to get involved, we would love to hear from you. Please reach out to me on Slack.

### Conclusion

We're really excited for this next phase. We believe it will help Exercism take huge steps forward and better serve both our students and mentors. We're extremely grateful to James, Gary, and the Sloan Foundation for their support
