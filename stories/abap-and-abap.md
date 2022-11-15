# Transcript: ABAP & ABAP with Lars Hvam

**Jonathan:** Hello and welcome everyone. My name is Jonathan. I'm the host of the Exercism and Podcast, and I'm joined with Lars today. Who is where you are based currently? Lars.

**Lars:** I'm in Copenhagen, Denmark

**Jonathan:** Nice. Cool. So a little bit north of the equator. I'm very much south of the Equa at this point in time. Really good to have you on today's show.
Really pleased that we could have this chat. And I'm just gonna kick straight off into it. Into this week's show. So Lars tells us a little bit about yourself. You, how did you get into tech? How did you end up where you are currently?

**Lars:** Yeah let's see, where am I currently, as we discussed Copenhagen. But mainly working in consulting in the area of sap custom code App and how did I end up there? Yeah, as usual it is a long story. But it's tech. So let's talk about tech rides. When I was young, that was a long time ago.
Me and my identical twin. I have my

**Jonathan:** You've got an identical twin, so how do I know it's not your other twin that's speaking today.

**Lars:** doing Microsoft stuff.

**Jonathan:** Okay. Scary.

**Lars:** stuff. So just ask him anything about sap. Then he cannot ask me anything about Microsoft. Then I cannot answer.

**Jonathan:** Yeah.

**Lars:** But when we were young, we started. Playing on the Commodore 64 ride, and I remember doing some very basic programming in the basic program language on the commodore, on a black and white, very small TV screen.
Spending hours doing that, getting a new computer, doing queue basics on the 3 86 and the 4 86. Upgrading to eight megabytes of memory riders were the day here. Yeah, that was Q basic doing Pascal programming. Eventually cut into Windows. And I did a lot of Visual Basic.
Yeah, I like Visual Basic. That was back in the year, in the nineties something, and eventually getting into running some Linux.
. And Yeah. For those that remember the good old Linux days, there was the themes.org webpage where it was possible to download themes for different window managers. Very much Linux thing.
And I think that's the first time I got really involved with the community and space, spending time on building that website in php. Yeah,

**Jonathan:** Okay. Wow.

**Lars:** Put some stamps on me. Visual Basic, doing a PhD programming. Yep.

**Jonathan:** Okay. Nice. Nice. Yeah, that's a good one.

**Lars:** And eventually going to university, doing a master in computer science and doing whatever programming and randomly getting a small job as I Yeah.
Need money to pay my rent. And doing other programming. that has been sticking with me for the last around 15 years of SAP ABA custom code development.
And, yeah. So next, next question. Why? Why did it stick around? Because ABAP is not a very modern program now. It is much like Cobo, but it's also a very interesting programming language because it's very wide, has a lot of different statements and a lot of different things can go wrong.

**Jonathan:** Okay. So there's a lot of pro problem solving and a lot of kinds of debugging. Is that the nature of it?

**Lars:** Yeah. So typically I say I do this kind of work because I really like debugging and there is plenty of old code to debug, right? So just last week I was fixing an old program that was 20 years old. I was like, Okay, cool, cool. And there's always, when looking into an old program that even though I'm doing this for many years, there's.
some old new stuff to learn some old features that have been used and still run day to day, right?

**Jonathan:** Okay, so you joined 15 years ago. The same company, or just started learning an app with SAP and have moved to different companies.

**Lars:** Right now, when, now I have my own company doing fun stuff and I defined what. And I've also been doing a lot of consulting for various consulting companies and also worked as an intern. So now I'm doing freelance and getting some freelance work so I can pay my rent again.
That's important.

**Jonathan:** Yeah. . It sounds like a common theme in your life, which is pay. Pay the rent,

**Lars:** yeah.

**Jonathan:** find ways to pay.

**Lars:** And yet spending too much time on open source projects, getting off track into something challenging.

**Jonathan:** Yeah. So do you have a team of people that you work with as part of your business, or are you fairly on your own in that sense? How, what does it look like day to day or in the week with your work?

**Lars:** So I'm on my own and I have my own company. When talking about collaboration, I do collaborate with the customer, right? And then in the open source space, I also have a lot of good friends in the open source community that help out with some stuff every now and then. And I help them out with some stuff here and then, so it's a win-win situ.

**Jonathan:** Yeah. So you actually are fully responsible, I think, for building the ab app track on exercism, if I'm not mistaken, or you have a high level of involvement. In building it. Talk us through a little bit about that.

**Lars:** Yeah. So the above track has been made up by various community members.
And these are mainly community members from the Arab kit home source projects. In a, of course we are a bit special, so we have to build our own kit client from scratch, but that's a different story for another day.

**Jonathan:** Yeah. Yeah. Yeah.

**Lars:** That's home. So we have various people contribute to the excess map. . However, the Java drag is a bit special, right? Because it is a programming language that's actually quite difficult to start up in because you cannot just download a JavaScript runtime like node or a Python runtime.
You cannot really do that very easily in ab. The latest, Way to do this was a target container with 60 that was 16 gigabytes as far as I remember.

**Jonathan:** 16

**Lars:** You need at least 32 gigabytes of memory to run this. And there's not a lot of people that actually have this infrastructure easily available.
And also running on this kind of infrastructure would be impossible with ex, I don't know. Infrastructure behind the ecosystem, but the tracks, it's all a lot of small dog containers that start up, run the code, check the exercise, and then shut down again.

**Jonathan:** Yeah.

**Lars:** And you're starting a dog container of this size can easily take 10 minutes.

**Jonathan:** ? No. No. Sure.

**Lars:** So we needed a different approach and luckily I had been working on my static analysis stuff. Started some years ago and it has abstract SY trees. So we actually take this code and make it into JavaScript code and then run it on Node and give the feedback on onm.
So we say that it is not the official language that we support as ABAP and also ABAP is a bit special as I knowed a few times before. that there is no real nice official description of the ABAP language as such. Not like other languages that have been designed. I think ABAP has mainly evolved into what it is from the seventies or whenever it was started.
So we make it up as we go.

**Jonathan:** So what challenges does that kind of create on a day to day work thing for you? I guess because you have to be able to look at a problem with fresh eyes every day and try and get into the mind of the person who developed it because you have very little, is it right in saying that you have very little documentation to refer to, so you

**Lars:** is a lot of documentation but it's not, it is just in text and it's not always. 100% correct.

**Jonathan:** . . Okay.

**Lars:** The correct way is to try the code and see what it actually does, right?
Of course there's a lot of things in the language that are correct. But also when we people work and build things in a SAP system, we typically are multiple developers in one system and this one system.
200 plus million lines of a code and 80,000 plus database tables,

**Jonathan:** gosh.

**Lars:** Which is good. I like one of them. And especially if you build everything very close together, you get a lot of cool static analysis that can tie things together if you, whereas if you do a Microsoft dark architecture, it's all loosely covered.
There are pros and cons in both .

**Jonathan:** So you prefer the monolith setup from a would that be a fair comment or is that a little bit, you whatever you prefer,

**Lars:** Yeah. I do prefer mono, but yeah. Okay. So with your basic p, prefer managing nets. Yeah. Cool. That's

**Jonathan:** Legacy code. Yeah. All stuff that's been around, all of that kind of stuff.

**Lars:** Yeah. I like old stuff. It's pretty fun, right? I typically say that when. . When I get old, I want to go into a PL one or APL programming some of those program languages. I don't know I can probably do that on M too, right? At some

**Jonathan:** Probably, there's, we've got everything under the hood at this point. Let's just see what we've got. Abl, Did you say APL or abl?

**Lars:** Apo, Oh, there's no APL track one.

**Jonathan:** Oh, maybe there's an opportunity.

**Lars:** Pls 12. There's no PL one. Okay. Okay. That's two track that that somebody in the community

**Jonathan:** Oh, you're signing up for right now,
That's

**Lars:** no. So what does the look on a daily basis and for instance, the ABO track? So the ABO track is an approximation of what is correct, and we always try to move it one step closer to being 100%.
So we actually have people with correct solutions that just doesn't work on exist

**Jonathan:** Okay.

**Lars:** because of this strange train pile I set up. But step by step, day by day it starts working And just keeps adding more and more unit tests to the backend and to the excess runner and everything. And then hopefully someday it'll be 100% perfect, but

**Jonathan:** Who knows. Who knows what's gonna come from that point. So now, how many clients do you typically work with during the week? Is it one or two or three or can it be up to 10?

**Lars:** Just one or two.

**Jonathan:** Okay. And that's been like an ongoing thing for a while.

**Lars:** Yeah. Yeah. I've been doing consulting for many years now.

**Jonathan:** . And is it mainly focused in Copenhagen or did during the pandemic did you get opportunity remote further afield? What's your kind of, do you travel much or,

**Lars:** have been traveling much in my younger days, but now I just typically sit at home doing remote work.

**Jonathan:** Okay.

**Lars:** It's

**Jonathan:** Yeah. You keep your coffee machine warm.

**Lars:** Yeah.

**Jonathan:** Keep things ticking over. So last, now you said you grew up programming from quite a young age and you were interested in that sort of, from a fairly young age. Did programming at any point make sense to you at some point?
Was there a moment when you were like it clicked for you or was it something that just you naturally understood from a young age? Like how would you describe it?

**Lars:** Oh, I don't know. I think I've always understood doing programming, right?

**Jonathan:** Yeah.

**Lars:** but typically, so my younger days, it's always been procedural programming,
. So I remember sometime in the uni in university there was this introduction to functional programming and logical programming.
And there's two, two completely different paradigms to actually do programming. And so there's a ProLock, as far as I know.
Yeah, there's a ProLock track. So for those that have not tried Logical programming, I recommend trying to do some ProLock programming and standard out ML is probably also there to figure out what actually you thought, new procedure programming, but there's also a lot of other things that you can do.
So yeah, I learned new stuff every day, so it has not clicked.

**Jonathan:** you're still wrestling with everything? No, it's just interesting because a lot of my experience has been. That I have to immerse myself in something like a language. And then suddenly the concepts which are foreign, and then overnight something will shift. And it's almost Oh wow that makes complete sense.
And some of the others I've spoken to on the podcast have said, Yeah, they have a similar experience. And I was like how did you do that? And they're like, Oh, one, one girl was like, Oh, I just imagine a program, like a story and I have the functions of characters and all of this kind of stuff.
So that was really interesting. But how did you decide that, like the AB app , was the thing that you were gonna focus on? Was it just Oh, this pays the rent, or was it I just really like this, I prefer it to JavaScript or whatever and

**Lars:** Getting into programming always starts by random, right? Doing a basic style by Raymond, doing Ava and starting by random, and it just stood out as a kind of a very challenging program language because it's so big in different statements like Java and JavaScript doesn't really have very many statements.
It has a large library.
Sensitively compared that in, in aba. We have a lot of library things as part of the program language, whereas in JavaScript, you call different uses, use the same kind of language construct to call the libraries.

**Jonathan:** Okay.

**Lars:** Yeah.

**Jonathan:** Okay. So it was almost like you just almost randomly discovered a, B, a and so what, looking ahead now then in the next sort of 10, 10 years, I don't know if you want to even think that far, but. What does the next five to 10 years look like for you in terms of programming and business? Have you got any sense of, Oh, this is where I'd like to be, this is what I would like to be doing,

**Lars:** Ah, you never really know, right? So I continue things as long as I think they're fun, right? If they're not fun anymore, then I'll drop it and do something else.

**Jonathan:** Okay, so that's

**Lars:** plan, right? He goes, It has to be fun to make it work day to day, in my opinion. It will probably still be ABAP on the menu in 10 years, I think.
And it comes down a bit to that. I'm quite picky when it comes to program languages and technology. So I do ABAP and I do JavaScript slash type groups, and then I try not to get into any other language.

**Jonathan:** Yeah. Okay. But if I was to say, Okay, Lars, you have to drop an app and JavaScript now and you have to pick up another programming language. Do you have any idea which one you would like? Yeah, I'll do that.

**Lars:** Yeah, so we Red talked apl,

**Jonathan:** Okay. Yeah.

**Lars:** A very cool, very, probably older than me in language, I don't know, close to. , APL and MPL one, I think they're both older than aba.

**Jonathan:** . Okay. Wow. So why are those ones out of interest? What intrigues you about those?

**Lars:** So APL is I've not really tried, but there's a few simulators on the internet that you can try. It's a lot of Greek letters where everything is a matrix, Multipl. , I'm not, It just looks very strange and yeah, stupid. But that is also what makes it fun, right? It has to be some kind of challenge.
And P one is just up, but something different. I'm not sure.

**Jonathan:** Something mysterious and a little bit

**Lars:** Yeah. Not really. I like to go for the old classical stuff and not all the new fainty stuff. So I could probably say rust, no. probably get into rust someday, but that's not really just because I need to, That's not because I want to.

**Jonathan:** Yeah. And do you notice that the number of people using AB apps is declining or increasing, or has there been a resurgence in surgeons in the language lately? What is your perspective on that?

**Lars:** Yeah, it's quite difficult and as Ava is these big systems that run internally in large multinational collaborations, it's quite difficult to get some real public numbers that are correct on what the numbers actually are. But the rumor is that the age of the developers that know this by heart is increasing and going closer and closer to getting off the market.

**Jonathan:** Okay.

**Lars:** So like cobot, right? So it's an old language, and young people don't find it too much fun, right? So it's old people like me, but that's also why we actually dip the abo track, right? We want to get more young people into the language and the ex system is a good platform to try out a lot of different things.
J out and it's very easy to get started. Sync, click, login. Start doing Jamal code. Done.

**Jonathan:** Yeah. And have you noticed that you have seen a lot of people doing the track? The Abbo track?

**Lars:** Yes. We have close to 5,000 students now.

**Jonathan:** Wow, that's amazing. Yeah.

**Lars:** Yeah, so here in September there was a September. A community code challenge that was organized by the SAP developer advocates. So trying to get people on the platform, trying out some exercises with what we call internal tables. In other languages.
These are typically a race, but we call internal tables, and nested internal tables, which is typically called effort to. Had doubled race, in other program languages.

**Jonathan:** Yeah.

**Lars:** So we got a lot of new students on that. And also we got a lot of feedback and box and issues on GitHub. And that's also a thing that we're not really used to in the ABA world.
Collaborating across multiple organizations. Actually sharing some code on kit hop is not something that is very typical in the community.

**Jonathan:** Is that just because the people, it's been very siloed in terms of this company doing its thing and then another company does its thing. And so the developers don't really talk much. They're in their specific context and the sharing and the collaboration is a little bit less, or why is that?

**Lars:** It is also due to the nature of an SAP system because it's a standard system. It can do anything for you, so typically when I help customers it's because the customer needs something special.

**Jonathan:** Yep.

**Lars:** And it's something special according to what makes their business unique. So it's probably something that other customers cannot use and also would not, will use because that customer is unique in a different way than a different customer.
But there is a source community evolving sharing code, but it is typically on the level of utilities. Utilities, stuff like logging and error handling or something. But it will get there. It just takes five plus years in the s p world for anything.

**Jonathan:** Yeah. Just for everything to start gaining that traction. So that was one of the things that we ask everyone who comes on the show, and I, you might have seen the document that I sent you, but we. , we typically ask people what is the one opinion or perspective that you would hold and not compromise on in the tech scene?
Or typically, what is the one hill that you would die on in the tech scene to, to make sure that thing stands forever and ever, and it can be as. Silly as I always write my logic after my css if you're in the front end. Or it can be really trivial or it could be something like I will never use GitHub , for example.
It could, but you just have to be able to argue or prevent, present your point. Thought through. But what is that one thing, that, one opinion that you.

**Lars:** One one. One Opinion

**Jonathan:** Okay. I can give you two. I can give you two. Yeah. Three. Okay. Three. You can have three opinions cuz I know that technical people are not very opinionated at all, typically.

**Lars:** Yeah. I think if people would describe me then sometimes I have very strong opinions about it and yeah. So one of my main opinions is say no this will not be possible. Do something else that better fits with the solution and the technology. So say no to using tools like Jenkins.
Say no to Jenkins, then it's one of the tools that I like to mention that nobody should use, right?

**Jonathan:** Why? Why? Why is that? What is the reason for that?

**Lars:** it's a lot easier to have your pipelines close to the code. So if you, I just consider it obsolete.

**Jonathan:** Okay. So it's like a level of abstraction that doesn't need to be added in if you know what you're doing.

**Lars:** Yeah. And there's other tools that do things better. Another tool that I like to skip
It is an eclipse. In the Java world, if you look back like five, 10 years the eclipse it has to typically been used for building a Java code
From my perspective it is at the point where Eclipse is not even used to build Java code anymore. It's typically some big enterprise applications on stuff used in Eclipse and building Eclipse that it was not really intended for in the beginning. There are not many other ways to do this and lots of other tools to choose from.
So Eclipse is eclipsed.

**Jonathan:** Okay. Yeah, I like it. And I'm gonna give you one more opinion. What is the other, the third opinion,

**Lars:** White space or is white space. So one of my side projects is static analysis for aba. And actually in aba it is, we have a lot of different statements, a lot of different ways to do indentation and ABA case and lowercase and Hungarian notation, everything. . Yeah. Doing, having double spaces somewhere in a text and something that really sets me off.

**Jonathan:** Is that just cuz it throws everything and it, it just nightmare

**Lars:** It just gets you off track and reading, like reading a text or a piece of code. Oh, there's two spaces here between what let's, it gets me off guard.

**Jonathan:** Okay okay, so let me, so Jenkins see your pipelines. Get it close to the code key Eclipse. Not necessary. And double white space. Those I've given you three opinions which I'm, which range in severity, it seems so No that's really cool. No, that's great. And yeah, I think you managed to fight, to hold your ground nicely on those.

**Lars:** And also when talking about continuous integration ride, don't make continuous integration into continuous waiting.

**Jonathan:** Okay, so push a code, then it sits there and waits to be PR for a, Is that what you

**Lars:** will get the feedback fast to the developer instead of having them wait for an hour, two hours for any feedback.

**Jonathan:** Okay. So is that because systemically, systematically it's a fail safe? Is that why that's in there? Is it just to pause so that things can be reviewed or why would

**Lars:** Just bad architecture.

**Jonathan:** Yeah. Okay. Okay. Interesting. Okay, So final question for today. I hope you've enjoyed yourself so far, but I wanted to ask you this.
What recommendations do you have for the exercism community for this week? If you could recommend one thing for the community, what would it be? It could be anything. Eat sushi. Go and jump in a river, whatever it would

**Lars:** Of course try out the track. That's probably

**Jonathan:** I'll give you the free. That's a free one. That's a free one, Okay.

**Lars:** But of course as noted a few times before, remember to have fun. It has to be fun. So sometimes even though there are some strange ideas, just if it's fun, try it out. See what happens.
That's typically also what I say in creating open source projects. Just jump into it, see if it's fun or not. Try it out. If it doesn't work, that's fine. Then jump up to the next party or open source project or language.

**Jonathan:** Yeah.

**Lars:** Because there are so many things to do in the tech world and outside the tech world that it's not really worth it if you're bored all the time.

**Jonathan:** Yeah, no, sure. No, that makes a good recommendation. So anyone out there has some fun in the tech space. Lastly, thank you very much for your time today. Really appreciate it. Just stay on while I, when I stop the recording, we'll just touch base at the end. But I just wanted to say a huge thank you.
And anyone out there who's interested, go and check out the ab app track. Go and run some exercises. Go and see how you get on with it. And if you wanna learn something that has been around for a while and is back growing, in importance and influence, you could say, because it's, it underpins a lot of core multinational platforms.
People that you would recognize, companies that you would recognize. If you wanna learn the inside track, then our app is definitely worth checking out. Lar we'll put all of the show links that you might have in the description below when we get there. But in the meantime, thank you so much and I'll check you in a second.
But yeah, thanks again. Appreciate it.
