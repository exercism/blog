We've now fully launched the second part of our automated feedback strategy - Representers!
This post gives a quick overview of how they work and why they're so useful.
It's a little more technical than normal, so strap in tight!

## What is a Representer?

A Representer is a piece of software that takes a student's solution and returns a normalized representation of it.
We then use these representations to streamline automated feedback and classification.

An example helps to explain Representers best.
Let's presume two students submit two submissions to the `hello-world` exercise in Ruby:

```ruby
# Student 1's submission
def self.hello(name = 'World')
  "Hello, #{name}!"
end
```

```ruby
# Student 2's submission
def self.hello(nom='World')
    "Hello, #{nom}!"
end
```

Although the code to these solutions is different (different indentation, variable names, and string syntax), they are essentially the same.
So by creating a normalized representation of them, we can _treat_ them as the same for the purposes of providing feedback.

## Why is this useful?

By creating these normalised representations, we can ensure that feedback given on one submission is automatically applied to other similar solutions.
This means that as a student you're much more likely to get instant, highly-relevant feedback.
And as a mentor you should now never need to give the same feedback twice to a similar solution - you do it once in the Automation UI and the rest works magically.

We can also use Representers and our existing Analyzers together.
Analyzers can comment on general points (such as variable names, linting, etc) and representations can focus on the wider changes that should be made.
There's a huge amount of potential that we're only just scratching the surface of.

## Who can add feedback?

The ability to add feedback to representations is limited to our super-mentors, about 150 individuals who have mentored hundreds of students and maintained a high mentor rating.

If you're a super mentor, you should now find the "Automation" tab unlocked on your Mentoring Dashboard, which you can use to access solutions that can have feedback given to them.
Please read the docs carefully as there's a lot of subtlety in doing this well!

## What's left to do?

There are a few new features for Representers that we'll be rolling out over the coming weeks and months.
We'll be posting information in our Forum (such as [this post on updating Representers](https://forum.exercism.org/t/updating-representers/442)) so keep an eye out there.

## Building a Representer

If you are interested in building a Representer, checkout out the [Representer documentation](/docs/building/tooling/Representers) for more information, or start a new topic on [our forum](https://forum.exercism.org/c/exercism/building-exercism/125) if you want to ask questions!
