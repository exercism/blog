One of the biggest challenges we face is tracks getting too popular and our mentors being unable to cope with the volume of submissions. The wait time for students increases, and mentors have the very unsatisfying experience of seeing queues keep growing despite putting a huge amount of work in to try and keep on top.

Solving this is far from trivial, but we believe we have some good solutions that will make things better (see our [recent blog post](https://exercism.io/blog/whats-next-for-exercism-aug-2019) for details). However, these will all take time to implement, and there is a very real problem today.

We've therefore decided to add an "Oversubscribed" mode to tracks, where when the median wait time for core exercises becomes too long, we:
- Restrict all new students joining a track to use Practice Mode
- Disallow any new submissions in Practice Mode

Once a track gets its median wait time back under control, the system will automatically allow new students to join Mentored Mode, and allow Practice Mode students to submit.

There are lots of extra bits of functionality we could add to this (e.g. queues to join, notifications when tracks unlock), but for now we're just taking a somewhat brute-force approach to fix the main pain point.

Hopefully this will give a better experience and more realistic expectations to students, remove the pain of ever-growing queues for mentors, and allow us to focus on implementing the bigger changes that will make a more long-term impact.
