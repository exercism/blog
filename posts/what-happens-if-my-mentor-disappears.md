Sometimes you're working away improving an exercise and your mentor disappears. Up until now, that's been a big problem, but this week we've implemented a string of small improvements to fix this problem.

It's rare that a mentor disappears but when they do it's generally just a slip of the mind. They got the notification that you'd posted something, checked your new iteration, then life got in the way, and they forgot all about replying. Our first improvement is a simple prompt to the mentor after a few days of them not replying. We send them a friendly message reminding them that you're waiting on them and asking them to respond.

If they still don't respond after this prompt, we move onto step two, removing the mentor from that post. We now automate this after 7 days of inactivity and put the solution back in the queue for another mentor to pick up. And importantly, it jumps straight to the top of the queue so you should hopefully get a quick response. In this situation, you'll see a nice little notification that tells you that the mentor has "timed out", so you know what's going on.

![New message example](https://assets.exercism.io/blog/what-happens-if-my-mentor-disappears-message.png)

We ran some scripts to fix all the existing solutions that were in this state from the last nine months and discovered that there were only 350 that had been abandoned. That might sound like a lot, but when you consider we have over 1,000 submissions per day, it's a tiny amount! All of those are now fixed, so if your mentor **did** disappear, then you should find a new mentor appearing soon!
