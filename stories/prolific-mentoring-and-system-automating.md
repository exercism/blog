# Transcript: Prolific Mentoring and System Automator with Isaac Good

**Jonathan:** Hi everyone and welcome to the Exercism Community Podcast. I'm privileged to be joined by Isaac, who is one of our maintainers and contributors, and has recently done a lot of mentoring of a lot of students on our. GOs are learning cohorts, which we ran for 30 days twice I think now. Especially in Go and Alexa and Isaac helped with the Go Track, which was awesome.
So Isaac, a huge welcome to you. Would you just tell me a little bit about where you're based, where you come from, and how you got into tech?

**Isaac:** Yes. I'm based in California. I live in San Jose, California. I got into tech
I, I thought the truth is I got to tech because my older brother was into tech and I would do whatever he would do. I had a bunch of siblings. We liked to hang out with each other, or some of us liked to hang out with others more than others. I had an older brother that I really liked to hang out with.
He didn't necessarily enjoy hanging out with me as much, but there was a lot of me following him around and wanting to be doing whatever he was doing. He picked up a Seaford Dummies book that was lying around. When he was about 15 and I was nine if I recall correctly. He was writing C and I'm like, If he's doing that, I'm gonna do that.
My programs were pretty simple and basic. At that age. It was more like, what is your name? Elo, Bob type exercises. They were not overly complex,

**Jonathan:** start somewhere.
you gotta start there. Yeah.

**Isaac:** I like, I was like, Oh, you could print out the visual. Character and it makes a sound. That's so cool. I wrote a program that literally just prints out a slash.
But I always started at nine. I was writing C programs. We had an old, 3.1 machine that booted into dos and then my brother had set up a batch script that when the computer booted it would display. menu that you could select, like launch Windows, launch games. It's like a game menu.
He could like type like five for Warcraft or whatever. So I was writing batch scripts as we had other games installed and whatnot and it was all downhill from there. My brother went to university for computer engineering and. once again. I was like, If he's doing that, I'm gonna do that.
So I started writing C when I was nine. I was writing visual basics six. In high school. I had a PO pilot that was writing various programs on the PO pilot in high school. My math teacher was really

**Jonathan:** Oh, was that one of those, like old school, was that sort of you remember they tried to release like the pre-pa thing and a few people got hold of it and it had the little pen scribble.
And everyone thought it was super cool cause it came out at the end and it was like, and then you could tap away that.
It was n't, I always remember that, cuz then the iPad started coming out and everyone was like, ah, a little bit early Palm pilot was just that little bit ahead of the curve, you know what I mean?

**Isaac:** It was great for a decade or so. But yeah, there was like the palm graffiti that used to be a little input pad and you had to write like characters, but they were based on the alphabet. So the A was just like a triangle and an F was like the right angle. , but yeah. And my high school math teacher was like, Hey, if you wrote the program, it's cool if you wanna use it on the test.
So I was writing PO pilot programs in high school, which was really cool.

**Jonathan:** Wow.

**Isaac:** yeah, I picked, I went to University for computer engineering. I wrote c and then people were talking about scripting languages. I didn't quite know what those were, so I randomly picked up the pearl. And then I got into grad school.
I went and I got hired by Google in 2013. They moved me from the east coast to California and that's where I picked up Python about a decade ago. And Python's been my primary language for the last decade. I went to PI at Google. So my style is very much influenced by the Google style. And that's why I've been primarily writing.
And then about four years ago, I guess 20. 18 or so. Google started pushing the Go Language internally League and I picked up Go at that point. Yeah.

**Jonathan:** Cool. And Isaac, like when you talk about like Google style, was there like a set sense of this is the right way to do it or is this kind of like, how did, when you just expand on that a little bit cuz that's,

**Isaac:** coding cells isn't necessarily the correct way to do it so much as a uniform way that everyone shall do it. They say like a good compromise or a good deal is no one's happy. So no one's quite happy with the style guide, but as long as everyone's following it, the code looks uniform. And that means that anyone can pick up any piece of code in the code, in the Google code base and make modifications.
And as long as they're following them. style guidelines, like the code is all uniform. You don't have to be like, Oh, this code base uses four spaces and dents, and this one uses two spaces where this has naming and convention like this for like that. Everything across the entire code base is done the same way.
Not everyone's happy with any of it. There's always, everyone has their own areas where they would wish it was done differently. But given that there is a documented style guide which is publicly available, look, you could just Google for. Google pipeline style guide and it tells you, this is how we write code at Google.
And as long as everyone sticks to that guide, the code all looks very uniform, which is really nice to be able to open any code base. And it just looks there's no surprises about Oh, they write this differently.

**Jonathan:** Is that why go, maybe. Fits quite nicely into that context because it's formatted and really this is how it is you can definitely see the Google influence on that.

**Isaac:** Yeah. I don't know how much Rub Pike was influenced by the Google approach or how much he influenced the Google approach. I'm not sure which led to which, but go definitely takes that to another level where. , they're even more like with Python there are different styles and people tweak their lines to accept different things.
For example, internally Google uses two spaces and dents and Python because there's a lot of code that's nested deeply and they don't wanna have just like a massive wall of space. Most people use sports spaces, and that's written into the Python documentation. But yeah, when it comes to go, they just took that to another level and they're like, the language itself has built in formatting, there is only one way to format there's no online flame words about which is the correct way.
There is only one way.

**Jonathan:** It saves a heck of a lot of back and forth. Let's just put it that way. Maybe,
So that's okay, so now when you started at Google, had you never done Python or had you dabbled or was it an easy jump? Like how? Cuz it's it, you made it sound like you got the job at Google and then it was like, okay cool. Learn Python, let's go.

**Isaac:** That's correct. I believe before I joined Google, I never wrote Python. I was writing Pearl for a year or two, I guess a couple years at that point I started writing. . My first summer job, it's a different story. I started writing pro six years prior to joining Google. So I was writing a fair bit of pro.
At that point I was writing a little bit of Bash so I was familiar with scripting languages, but I haven't ever written Python. But I, once you dabble with enough languages the learning curve is a little bit less steep to pick up another language because you've seen most of the constructs.
And it's just a slightly different syntax, a slightly different toolkit. But like it's a lot of the same old, just slightly different, written differently. The constructs tend to be pretty similar, so once you've picked up four languages, picking up a fifth, it's like, Oh, this is just written slightly differently.

**Jonathan:** Yeah. Yeah. That, that, that is interesting. So now you giggled a little bit about your first job, like out of high school. So now you, cuz it's, it, had you always been like, I'm gonna be in engineering, like I'm gonna be doing the computer thing. Had
that always been like a conscious thought or was it always this is just where I am natural. Fit and I enjoy this, and that's it. Like how did that kind of play out,

**Isaac:** I was very much just trying to follow my brother's footsteps. He went to computer engineering. How he started writing programming. He started programming when I was a kid. I followed along. I have been writing programming since I was young. He went to computer engineering and that was the, I wanted to do the same thing as he did.
And also I was having a great time writing. Programming and all that. So I had, from the time I entered high school and my brother was going to university already, like I knew that's where I wanted to end.

**Jonathan:** So he's a few years older than you said. It sounds like he played a massively big influence on you as a person. How many other siblings do you have? Or, or was he like the sort of the bees knees

**Isaac:** I've got eight. I've got eight siblings, but he was definitely the one that I got along really well. He's one of, I guess I got along with some of them better, more than others. When you have eight, there's always a range. I got along with him quite well. We tend to think a lot
similarly. We tend to have similar interests.
We would geek out about computers all the time. We still do. His wife doesn't like one that becomes the dinner table conversation. She's No work at the dinner table. But like we just geek about programming all the time and talk about it all the time. So it's really hard to say how much was just me wanting to copy him versus us just having similar.
But we definitely have similar interests. Now, I don't know how much of that is, nature versus nurture. I can't really comment on how much of that's me copying him versus that's just having similar interests. But given that I was following his footsteps from an early age I, I was following and he was setting the path to some extent, and I was following.

**Jonathan:** Yeah. Yeah. Oh, no, that's really cool. And is he, where is he now? Just out of interest? Is he on the East Coast and

**Isaac:** He's still on the east coast. He's working in tech. We've worked at the same company briefly. He: Yeah. Okay.

**Jonathan:** Okay, cool. So there's that, that, that's cool. I just was interested to ask now. Now one of the things is that you've been really involved in the cohort that we've just had. So the latest learning cohort especially with Go, we were running a 30 day thing with Go, like how and then your involvement with Exercism previously has been specifically in maintaining, but also quite a lot of mentoring as far as I understand.
So how have you found that split? How did you come across Exercism and. What are the different aspects that you enjoy contributing towards?

**Isaac:** So I originally came across Exercism because I was trying to learn real and hasket. I took a Haskel 1 0 1 class at Google. Quite fun. And then I was like, Oh, I should spend more time doing this. And that fell aside. And then I tried to come back to it. Not having any language, I find that the easiest way to learn it is to actually write it.
And the easiest way to write it is to have a purpose for writing it. I haven't found a great purpose for writing Hasco, which made it really hard to pick up. But I found out just, and I'm like, Oh, this might help me write more, has. So that's how I originally found Exercism. Once I was there I was like, Oh, there's a python track and a shelf track, and I guess I could write exercises in here.
So I

**Jonathan:** and down the rabbit hole. And down the rabbit hole you went. Yeah. Yeah.

**Isaac:** I started solving exercises in Python. I started solving exercises mesh. I did a couple of the go exercises. When the go came up and I was looking through some, my prior solutions, I saw a lot of them were submitted three years prior. So I did, I first signed up for the Go Track in 2019 and solved a chunk of those exercises back then.
And then I've been doing Python for a decade at this point, so I felt relatively comfortable joining as a Python mentor, which is where I spent most of my time on Exercism. These. . And then I started submitting PRS poll requests to the Python track because there were things that were out of place.
And then I started getting involved in the Bash track, and I'm not entirely sure how it happened, but I went from submitting fixes to the batch track to being a Bash maintainer.

**Jonathan:** Just like that. It's just Ooh, Yeah. What? Careful what you sign up for

**Isaac:** Yeah. And then Glen wrote out the OC track and I was like, Oh, I know Oc I like a. Hop onto that bandwagon. So I helped build up the exercises on the track. I had, when I had written go exercises, I'm not entirely certain, but I think three years ago when I did soft go exercises, I completed the entire track.
And then one of the mentors was like, Oh, you've finished all the exercises. Maybe you should become an. I'm not sufficient. I don't like to go often enough, regularly enough to feel that comfortable mentoring it. So I wasn't really a mentor. But then when I joined the cohorts and there were a bunch of people who wanted mentoring, I was like, Oh, I guess I could sign up to mentor for the month and help out there.
But I actually recently joined the cohort as a student, and then slid over from the student such,

**Jonathan:** out what you sign, watch out what you sign up for. I tell you, it's seems to be a pattern emerging where you sign up for one thing and then you end up as another. But that's really cool. And okay. And then what, in terms of like when you've been mentoring students on the Go Track, just specifically what are some of the like com most common things that you. The go track, there's probably quite a lot of seasoned developers, I would say who did it, Like people who'd had a bit of track record in development, but how, what were some of the things that you noticed that you were like, okay, that those are the common things that people seemed to get stuck on?
Were there any patterns or things that you found that were okay, that's common. That's fairly consistently appearing.

**Isaac:** I don't know. I haven't seen it. Most of the mentoring that I've seen has been on people on completed solutions. People more often than not, will have solved the exercise before they go for mentoring. So people generally aren't stuck for most of the interactions that I have. So it's mostly, they've successfully completed an exercise and then it, a lot of the input is is there a more efficient way to do this?
Is there a better algorithm? One of the common ones that come up way too often is string building. In languages like Go and Python where strings are immutable, doing a lot of shrink and continuation is not very efficient. So it's a lot of Hey, you could build this using an array and then join the strings where you could use a string builder and go.
So there's a lot of points pushing them towards better, patterns, best practices and patterns.

**Jonathan:** Okay. That's cool. No, that's fascinating. So now, currently what does your day to day look like with work in terms of like where does development fit in? You say you've been in tech for a while, like what does the day look like? What are the challenges? What. The bits that you enjoy with work at the moment.

**Isaac:** So I'm in site reliability engineering. Which is loosely similar to DevOps. It's got some cis admin stuff in there. I've been carrying a pager on an on-call rotation for the last decade or so. So my day to day depends a lot on whether or not it's my on-call week or not. When I'm on call, it's a lot of watching.
There's ticket queue, support, queue making sure that any feeling processes or problems are diagnosed and. . So that's roughly, one week out of six where however large the team currently is. And the rest of the time, I spend a lot of time messing with automation. So it's a lot of identifying processes that are cumbersome and making them less cumbersome.
It might be that, when this problem happens, we have to run, we manually repair by doing these commands and those commands, and it's like, Why are we running these commands by hand? Could we write a python script that could do all of that for you? Or can we improve the tooling to not fail and catch that problem itself?
And a lot of just trying to improve the day to day of how we run systems such that humans are less involved or don't need to be as involved as deeply to keep things running smoothly.

**Jonathan:** . So do you enjoy trying to find those little areas where there can be optimizing, where things can be optimized? Is that kind of like how much of your job? Reacting to stuff, and then from the reaction being like, Oh, cool. This is an opportunity to begin proactively looking for those little areas, like what's the balance, typically?

**Isaac:** I enjoy automation. That's probably the thing I enjoy the most. My job is being able to automate things. It's not always reactionary. Reactionary could mean that something breaks. It could also be like, Oh, people are running this command where I found that there's this command that we tend to copy paste and can I improve that?
Where I'll see someone make a change to like a runbook somewhere where they approve a command somewhere, and I'm like, Oh, that command's pretty messy. Can I just rewrite that from scratch?

**Jonathan:** So refactoring you, you could say.

**Isaac:** refactoring noticing that there're tools that are cumbersome to use in deciding to rewrite those where write rappers around them.
I'll see. Yeah, like I'll see code changes to some large complicated program and be like, Oh, that program's a mess. Can I go in and rewrite that to where I refactor It.
Or creating new, it's not always refactoring, so sometimes just create new tools like, Oh, we have a process that involves.
20 steps. Let me just shove that all into a program. A lot of it does tend to be, I have to discover these somehow. Sometimes I discover them because I'm assigned to carry out a set of tasks and then I'm like, I don't wanna run these by hand. Sometimes I discover them by just noticing I'll be looking up some code piece somewhere and I'll be like, Oh, this other code over here, this other team maintains doing things poorly.
Let me reflect on that. Or use the modern libraries or whatever.

**Jonathan:** So a lot of. just being able to see, so how much free rain do you have? Do you have quite a lot of free rain to go around and swoop in here? And that must be quite fun, quite enjoyable.
on one level.

**Isaac:** My manager affords me a lot of free rings, which is really nice. I don't know how much of this came from. my back. I'm not currently at Google, but I don't know how much of this came from my background at Google. At Google, people were very open to swooping in and being like, Oh, I noticed the others.
I happened to use this library and it could be improved in this way. Let me go ahead and fix it. I very briefly worked at a startup where the culture was very different than it was a lot less open. And at the startup, people were very protective about their code bases and having other people modify their code.
Is not very accepted. So I'd be like, Oh, this is an issue with this code base. Let me change it. And people are like, That's not your code

**Jonathan:** That's, Yeah. back off. But in, that's interesting because you assume that a startup would be way more just get the job done and do it as cheaply as possible, but actually, maybe Google was way more able to handle that As a concept and I, Sorry, I've just put the light on cuz we, No lights currently for everyone listening. No. Interesting. Cape Town. Every now and then, just now I'm blinding myself, but it's fine. But it's interesting going back to that point about the startup culture and how like people are way more, I ironically caught up in having ownership of stuff and then maybe ham, ham, hamstringing things a little bit.

**Isaac:** Yeah, I don't know that being a startup necessarily ties well to being a. or like a play-based work culture at Google. A lot of what people did was play where they enjoyed what they did. They do it because they enjoy it. They were very
friendly about it or very open about it. Some other workplace cultures are less about necessarily doing things because you enjoy it and more about it's a job or This is my code and like I know how this works.
I don't want other people messing with it. I'm not entirely sure what goes into making these workplace cultures change. . But Google very much did foster a sense of, everyone has access to all the code, you're all empowered to make changes to it. Go ahead and do whatever you think is the right thing to do.
And then, and my current job with my current manager, he's also, he's been very, he's giving me a lot of free worry and he's like, sure, you found something to fix. Go ahead and fix it. You found an area where things could be improved. I'll just get outta your way. Let me know what I could do to help.
So I very much am able, , self-direct a lot of what I do and just, if I find an area where I'm like, Oh, I could make this better. He's Yeah, that's cool. Go for it.

**Jonathan:** Okay, Nice. And you, The company's based over on the East coast. Am I right in saying so, so you asked if you work remotely. I think. I remember saying you were about to move. And then Covid hit and it was eh, that whole came, that whole thing came to an end. How are you finding the remote, the distance, the time lag, all of that kind of stuff?
Does it affect you or Yeah,

**Isaac:** I definitely do miss being in an office and interacting with people in person. So there's that. The time lag has been very accommodating with the time difference. So I am three hours behind rest with my team. There is. Short daily standup that I miss. We have two daily standups for two different products.
So the first one I do miss and my team has been very good about accommodating me there and using Slack internally. So they would, they're very good about having a daily slack thread with issues that came up so I could be caught up and if they need anything, they'll ping me. I do try my best to be responsive and trust any of that stuff as quickly as I can in the morning.
It is a little bit like the time lag is not great, but it's also not, they've been, we've managed to work through it quite well. And then conversely there is the other side where they do know that they have someone on the team who's awake a little bit later. So I've had some colleagues like, be 6:00 PM on the East coast and be like, Oh, this is broken, Hey, Isaac on the west coast, Isaac could help me out with this because it's still only 3:00 PM there.
So it does work in both directions. . But yeah, the, I was, I, yeah, so I left Google in 2019, Sorry, 2020. I interviewed in 2019. I was supposed to join 2020 in May. I was planning and moving in August , April, 2020, but Covid started and all that, and the office got closed down and there was just a lot of Oh, the office is not yet open.
You'll move as soon as the office. And then two years into the pandemic, they started opening the office again, and then I was like, I'm not sure I wanna move anymore. You sounded really exciting when, like there were all these businesses opening, venues and stuff going on, but now that there's a pandemic, a lot of that's not quite as exciting sounding anymore.
So I transitioned to a remote position after working remotely for two.

**Jonathan:** And are you like a city person or a countryside person or like halfway in between? Like what? Because New York is a city, it's like a hundred percent city. There's no two ways about it. , so that would've been quite a shift,

**Isaac:** yes,

**Jonathan:** exciting nonetheless.

**Isaac:** I did grow up in a large metro radio, so I am no stranger to city life. I currently live in suburbia. . I enjoy hiking and cycling and I try to get outdoors as often as I can. So I do enjoy living in suburbia, near amazing hiking and cycling trails and all that. Moving to New York would be quite a change, but I know, I figure mixing it up every so often is not a bad thing.
And to fight, hate my life in New York, I could always move away.

**Jonathan:** It's not that tricky to do that, but no that's cool. So now you sp you probably correct me if I'm wrong, spend a lot of time on screen in an office, like home office or whatever. Do you get out every day to how do you balance the whole in the screen world versus kind. Do you have your daily time where you like, I gotta get out and just get outside and do something else?

**Isaac:** I wish I did some days where some months or some years I'm better than others. 2020. I was pretty good about psych length almost every day. I do get outside most weekends. I try to do one hike a week. I haven't been great about it, but I am going for a hike. Depends on the season I'm in.
California. Some weeks are extremely hot. We just had a heat wave where it was over 40 Celsius for about a week straight. So that makes it challenging to get outside. We're in California where we have fires. Sometimes we'll go for a week or two where the air quality outside is not entirely safe to breathe.
So that makes it
challenging to be outdoors in California some weeks. And then being indoors with a pandemic is also challenging. So there's definitely some weeks where I'm much more indoors than others. But I am getting outside. There's been, I've gone there's been six month stretches where I've been hiking, going for hikes, like at least every other.

**Jonathan:** Not cool.

**Isaac:** I've had stretches where I've been camping like once a month for, six months straight. So there's some stretches where I'm better than others. And then there's some stretches where I'm just like in the house for two weeks straight.

**Jonathan:** Yeah. No, that's cool. And so Isaac what does the next kind of, this is maybe, I don't know, maybe you haven't thought this far ahead, but what does the next five years look like for you? In terms of what do you have any idea? Are you I want to start a business on my own, or I want to do this, Or are you just ah, just enjoying life and enjoying where I'm at.

**Isaac:** I, before I moved to the West coast, I thought I had a better handle on what my future's gonna look like, But having all of that turned on its head taught me that it's really hard to predict what's gonna happen in the next year, let alone five. I'm quite, I just changed jobs

**Jonathan:** months

**Isaac:** recently. I changed jobs about two, two and a half years ago.
I'm quite enjoying my current job, so I don't see that changing anytime soon. I'd be happy to remain at the same job for the next two, three years five years down the line. I love living in California. I love being able to go hiking and biking, camping and all that, so I don't see myself leaving California anytime too soon and I don't see myself leaving that job anytime soon because I do enjoy working there quite a lot.
So I'm pretty content and I don't see any major changes. I don't have any major changes planned, but it's really hard to say.

**Jonathan:** No, that's cool. Okay, so I've got a couple more questions which I would love your perspective on. The first one is probably not the one that I prepared you for, but the one, so if you were gonna if 10 people walked into your office right now, 10 complete strangers and who didn't know anything about coding, and you had a, I don't know, a harpist and a gardener and whatever, what would be the top three tips you would give them to learn how. Start coding, if you could boil it down to do this at all costs, what would some of those tips be?

**Isaac:** So the number one recommendation I would have is to try to find a problem that you could solve with coding. So you have. Concrete project that provides motivation without a specific goal in mind to drive you forward. It is extremely challenging to
Starco, Inc. Learning is similar to any other skill.
Learning to code does require a fair bit of tenacity or grit. You just need to keep at it. It could be very challenging at first.
It could be very frustrating and without something to drive you forward. It's very easy. Give up on it. So if at all possible having a, something you actually wanna do with it helps a lot.
And all in the same constellation of advice. It's just, you have to have, you gotta keep at it. It helps a lot to be patient with yourself and recognize that you're learning a new skill and you're gonna fail a lot. I've had some people.
try to learn coding and they get frustrated.
They're like, Oh, I'm usually good at things and I can't, it's not working yet at the box. And they're like, Yeah. Failure is part of the learning process. And if you're uncomfortable failing at something, you can have a really hard time picking up new skills. So you have to be patient with yourself and with the process.
And just a lot of, keeping at.

**Jonathan:** Yeah. That's really, that's useful. I would say that I've only just realized how methods work in light, and that's just been going through and because a lot of the knowledge that when people talk about stuff, there's so much assumed knowledge when people teach, especially So it was like throwing this word methods around. I'm like, what on earth is a method? What is going on? And it was only through the cohort with Go that I started realizing, Oh, methods of working this way. And, but it was almost like a penny drop. But I had to immerse myself in this environment and this terminology for so long that it seeps in. I'd say that was one of the biggest learnings for me was like, not to. learn it all, but just chip away at one simple concept cuz everything interlinks so much that eventually you are able to start stringing the mental model together. Which is really important. So that's a great little tool. So I'll let people know about Isaac's recommendation, be patient and be kind to yourself and chip away. That's really cool. Okay. Then the final question I have, and before I let you crack on with the rest of your day, We talked about as a team this concept of the hill that you would die on in tech, that sounds pretty melodramatic and pretty, a lot of drama involved. And the idea is essentially what is the one thing that you believe is absolutely key that you think is like an immovable mindset or perspective to have in tech. So a good example would. I don't know, on a very trivial level, I always put my functions and then I code my CSS if I'm doing front end. So functionality, then logic, then whatever it could be.
We had one Rebecca who runs the unison track. She was like having a genius who's opinionated and tricky to work with. She would rather have 50 people who really love working in a team and solving problems together than one genius who takes up all the bandwidth in terms of managing.
So that was one of her. And I phrased it nicely, but what would be your hill that you would die on in the tech space that is your kind of non-negotiable?

**Isaac:** This is probably extremely heavily influenced from how Google does things at Google. They have this concept of readability where code is supposed to be easy to read, and a lot of what I do in, when I write code, I want my code to be simple to read and understand. . And I've seen a lot of code, especially in code.
There's a lot of focus on efficiency and benchmarking and making your code faster. And often I'll acknowledge that the way I'm doing, it's not necessarily the most efficient, but if I find that the code is easier to read I would prefer inefficient code that's easy to read over. Super efficient code.
So let there's the. , it's a common quote. I'm not sure who exactly it's attributed to that the root of all premature optimization is the root of all evil. And whenever people are like, Oh, how can this be more efficient? I'm like, Does it need to be more efficient? Have you run into, are you running in production and running into issues with efficiency?
Is this too slow? Tease in production if you haven't actually experienced an issue with the code in production where it needs to be more e. Why would you make it more efficient? It's easier to read as is. It's easier to maintain. Other people could understand what's going on. Why would you give away? Written code that's easy to work with and easy to maintain to save some CPU cycle.
Its electricity is cheap enough and CPUs are cheap enough that we don't need to optimize code. Just optimize.

**Jonathan:** Yeah. It's, it is always funny because it's one of those things I'm like, Oh, we our program compiled in ran in 30 millisecond. And they're like, Oh, but we made it go down to 20 milliseconds. I'm like I, could not tell you. I couldn't tell you which was quicker. Which was slower. That seems quick. So I think I it's a good point. I'm sure I'd enjoy reading a code, but that's great. I, Isaac, thank you very much for your for waking up early and for putting up with load shedding in the southern hemisphere and for me, sitting in complete darkness. I'm sure that is probably quite comedy for you. But thank you very much for your time and I look forward to seeing you on future learning cohorts and in the mentoring streams and all of that. And thank you for all the in contribution that you make towards Exam and across the board. So appreciate it. And Thank you so much again, and I will see you in a second.
No pleasure.
Take care, Isaac. Bye.
