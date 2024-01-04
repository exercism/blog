> this post originally appeared on [David's website](https://xavd.id/blog/post/12-languages-in-12-months/) and is republished here with permission

Last January, Exercism [announced](https://forum.exercism.org/t/the-12in23-challenge/2213) a new program called `12in23`, where they challenged participants to try 12 new programming languages in 2023. Each month would have a theme (such as "Analytical April" or "Object Oriented October") and would highlight specific languages to try. I love learning new things and have become a bit of a (programming) language nerd, so I decided to give it a try. 12 languages, 12 months!

Now that the year is almost over I'm incredibly pleased with how the project went. I successfully tried 12 new languages, met great people in the Exercism community, and shipped some cool open source contributions along the way! In this post, I run through them all and talk about what I got from each.

## Picking Languages

I laid out a few guidelines for the year to help me make the most of the experience:

1. Languages should be either brand new to me or at least unfamiliar enough that I'd feel like I was learning a lot.
2. Selected languages should be (potentially) practical for me to learn more of in the future. This project was just for fun, but I want to be spending time learning (at least partially) useful things.
3. I'd install all the local tooling & VSCode plugin for any language I was using. I wanted to compare languages on roughly equal footing, with as much type hinting and intellisense as possible. In college I did all my programming homework in Sublime Text without any linting or auto-complete. I worried that if I learned to program while using all those tools, I'd rely on them too much and wouldn't be a good programmer. Instead, the opposite has happened. The more cognition I can offload to my tools, the more I can think about the actual problem at hand. Don't remember things, [remember how to find them](https://hynek.me/articles/productive-fruit-fly-programmer/).

Let's get to it!

![](./images/badges.png) - FIXME

## January (Unthemed)

When January started, the Exercism team were still in the process of choosing monthly themes, so that month’s language was dealer's choice. Lacking direction, I kicked the year off with [Go](https://go.dev/). I had done a crash course in the language in mid 2022, but I hadn't used it much since and didn't feel at all proficient.

Go is an interesting language. Its strict compiler means that Your Program Will Be Correct and you don't move an inch until it thinks you're safe to so do.[^1] Its verbose approach to error handling means you're never surprised (at the cost of writing `if err != nil { return err }` so _so_ many times). It does a good job making hard things easy (such as parallelism via channels) but also makes some easy things hard (string manipulation). It's got a robust standard library, meaning you can get most tasks done without 3rd party modules. I like how much of the ecosystem (formatting, installing, building, etc) is first-party and built into the `go` command. The language has [its detractors](https://fasterthanli.me/articles/lies-we-tell-ourselves-to-keep-using-golang), but I think it largely succeeds at its goals of correctness and maintainability.

I didn't enjoy using it so much that I'll reach for it as a first choice, but it's great tool to have in my toolbelt for performance-sensitive programs, like showing [the nested path](https://github.com/xavdid/dotfiles/blob/e82786eb835390a67ac890753472dea637fb85ac/bin/bin_source/truncated_git_path.go) in my shell prompt.

## Functional February

![](./images/functional_programming.jpg) - FIXME

[February](https://exercism.org/blog/functional-february) jumped right into the deep end with [functional](https://en.wikipedia.org/wiki/Functional_programming) languages, which are a math-y offshoot of more common imperative programming languages. Functional languages are known for their "pure" functions (without side effects). I chose [Elixir](https://elixir-lang.org/), mostly because my friend [Caleb](https://ca1eb.omg.lol/) has used it for Advent of Code and raves about it.

I quite enjoyed my time with Elixir. It was inspired by Ruby (which tracks; its creator, José Valim, was a core Rails contributor). I found it simple to express functional concepts such as method chaining. I loved all the syntactic sugar that made that easy, such as the pipe operator (`|>`):

```elixir
foo(bar(baz(new_function(other_function()))))
# becomes
other_function() |> new_function() |> baz() |> bar() |> foo()
```

It was also my first time working with macros, or code that writes code. Because Elixir programs can be expressed in an [AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) that is itself valid Elixir code, it's easy to write code to produce other valid code. This is a really cool concept that Elixir made easy. I also dug the way that functions could pattern-match against their argument shape, so function calls could be routed to the appropriate implementation:

```elixir
defmodule TuplePrinter do
  def print({a}) do
	IO.puts("single")
	IO.puts(a)
  end

  def print({a, b}) do
	IO.puts("double")
	IO.puts(a)
	IO.puts(b)
  end
end

TuplePrinter.print({1})
TuplePrinter.print({2, 2})

# single
# 1
# double
# 2
# 2
```

It seems like the sort of feature that's either great or makes your code total spaghetti. Either way, it was a cool concept!

Elixir also benefits from running inside Erlang's [BEAM virtual machine](<https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine)>), which gives it a big ecosystem to communicate with. It's great at concurrency and the core of the beloved [Phoenix web framework](https://www.phoenixframework.org/).

While I don't have an immediate need to use Elixir, I found it really fun to work with and definitely something I'd be open to revisiting. Plus, it was an interesting challenge to tackle familiar problems in unfamiliar ways (namely, recursively).

## Mechanical March

[March](https://exercism.org/blog/mechanical-march) focused on "system" languages, which compile down to machine code.

Of the options, Go was the only language I was interested in.[^2] Now, astute readers will notice I'd already done a month of Go, so repeating it wouldn't count towards my 12. Well, when I picked it for January, they hadn't announced they were doing themes yet, so I didn't realize I was painting myself into a corner.

If I had known [Bun](https://bun.sh/) was coming I probably would have tried [Zig](https://ziglang.org/), but unfortunately I couldn't (yet) see the future. So, absent a more compelling choice, I went with an extra month of Go with the understanding that I'd need to double dip at some point later in the year.

## Analytical April

[April](https://exercism.org/blog/analytical-april) was all about languages popular for data science. I was too familiar with Python and I did R in a stats class in college (and didn't care for it), so [Julia](https://julialang.org/) it is!

I enjoyed my time with it but mostly because it felt so similar to Python. It was a little unsettling -- like being American in Canada. Everything feels very familiar but is just a _little_ bit off in a way that's hard to put your finger on. Suddenly, someone offers you a [2-dollar coin](https://en.wikipedia.org/wiki/Toonie) (or a function that's like _really_ well-situated for doing matrix math) and you realize you're not in Kansas anymore.

The thing that stuck out to me the most was Julia's type system. It was annotated (optionally) like Python's type system but had runtime checks to ensure arguments matched their declared types. I think Python's system strikes the right balance between plugging into tools and not getting in your way, but I admit Julia’s runtime errors for mis-typed functions were also useful.

Ultimately Julia was neat, but it's not something I expect I'll need in the future.

## Mindshifting May

[May](https://exercism.org/blog/mindshifting-may) doubled down on "try something new" by highlighting languages that do very unusual things. I took the opportunity to try the ever-popular [Rust](https://www.rust-lang.org/). I gotta say, I get the hype.

While the infamous borrow checker certainly takes getting used to, I liked the way it made me think about my programs more carefully. The compiler was certainly strict, but the error messages went above and beyond helping me fix issues. I won't say I was especially productive in my first week, but I feel like I can at least see the top of the learning curve.

`cargo`, Rust's package manager, also deserves special mention. While I didn't install any 3rd party packages, its build, testing, and formatting functionally were great. Same goes for its VSCode extension, which had all the niceties I'd expect from a statically-typed language like Rust. Good developer experience really does make all the difference.

While they're very different at an implementation level, Rust felt similar to Go for what I would use them for: making programs run very quickly. [Many](https://astral.sh/ruff) [tools](https://biomejs.dev/) in languages I use regularly are starting to turn to Rust for its performance characteristics, so I anticipate seeing it more in the future (even if I’m not writing Rust myself).

## Summer of Sexps (June)

[June](https://exercism.org/blog/summer-of-sexps) was the month of [S-expressions](https://en.wikipedia.org/wiki/S-expression) a common syntactic form in [lisps](<https://en.wikipedia.org/wiki/Lisp_(programming_language)>). I picked [Clojure](https://clojure.org/), a functional language that runs in the [JVM](https://en.wikipedia.org/wiki/Java_virtual_machine).

I had written a little bit of Clojure many years ago. I was fresh out of school and became the sole maintainer of a business-critical daily script at my first job. Needless to say, that was a tricky time. I was curious to see if now that I was older and wiser, it was any more approachable.

I'm happy to report that it was! The functional experience in February helped me think recursively and the syntax wasn't all that bad when you got down to it. Its JVM interoperability would also be useful if I were using it in a bigger project.

I don't see myself ever using Clojure for anything when there are alternatives available, but it wasn't an altogether unpleasant experience.

## Side Quest: The Universal Test Runner!

For years, I've used [a little bash function](https://github.com/xavdid/dotfiles/blob/6bd5f56b1f9ad2dcef9f8b72413d30779b378aef/node/aliases.zsh#L45-L73) to run the unit tests in my current directory. As I was working in all of these new languages, I found myself adding lines to it for convenience; remembering to run `t` was much easier than relearning the language-specific test command over and over.

As the logic required outgrew my comfort level with bash, I took some time in June and spun the project off into its own thing: the [Universal Test Runner](https://github.com/xavdid/universal-test-runner).

I [shared it](https://forum.exercism.org/t/introducing-the-universal-test-runner/6228) in the Exercism forum and got a nice reception. They liked it so much that we decided to build similar functionality into the Exercism CLI itself (which is written in Go, a topic I had fortuitously just brushed up on). So for the second half of the year, I could run `exercism test` to run the test suite for that month’s language (a command which is natively supported in the Universal Test Runner).

If you'd like to learn more about the process, I wrote about it in much more detail [when it launched](/blog/post/run-every-test/).

Anyway, moving on!

## Jurassic July

[July](https://exercism.org/blog/jurassic-july) showcased old languages. It was pretty slim pickings this month in terms of practicality. I started with the venerable [COBOL](https://en.wikipedia.org/wiki/COBOL) since I heard it still ran a lot of critical infrastructure. But, with an early August wedding bearing down on me, I didn't have the bandwidth to sit down and learn such a different-to-me language. So instead, I swapped to [Visual Basic](<https://en.wikipedia.org/wiki/Visual_Basic_(classic)>) as the least-bad looking option.

There's not a lot to say here. The language seemed a little verbose but easy enough to use. My understanding is that it was really designed for UI development on Windows, so doing little exercises makes it hard to get a good read on it all.

## Appy August

[August](https://exercism.org/blog/appy-august) was awash with the languages that build apps. Unsurprisingly, there were a lot of choices this month. I went with [Swift](https://www.swift.org/). As someone who uses a lot of Apple products, their custom-built language is quite relevant to me. I wasn't totally new to it- I published a [single iOS app](https://github.com/xavdid/pitch_awesome) in 2016 written purely in Swift. But I hadn't touched the language since and it's evolved a lot, so I figured it still counted.

I was pleasantly surprised with how easy it was to work with. In contrast to many of the other languages here, Swift is quite new. It was first released in 2014 and has clearly benefited from lessons in modern language design. It has a 1st party package manager, optional chaining, first-class functions, and sane string interpolation. It felt ergonomic to read and write, even while not using Xcode.

All that said, Swift is mostly useful in the context of apps for Apple platforms, which I don't currently write. While it worked well for the exercises, I don't anticipate coming back to it anytime soon. I do love that I can [write it on my iPad](https://developer.apple.com/swift-playgrounds/), though!

## Slimline September

[September](https://exercism.org/blog/slimline-september) explored very concise or small languages. I went with [jq](https://jqlang.github.io/jq/), a tool I've used and loved for years.

I've always thought of it as just a tool for working with JSON though, not a general-purpose programming language. I was pleasantly surprised to see it has all the normal trappings -- functions, variables, loops, etc. -- so I could write some fairly complex programs:

```jq
# input: { "series": "1", "sliceLength": 1 }
. as {series: $series, sliceLength: $sliceLength} |
if
  $series == "" then
	"series cannot be empty" | halt_error
  elif $sliceLength > ($series | length) then
	"slice length cannot be greater than series length" | halt_error
  elif $sliceLength == 0 then
	"slice length cannot be zero" | halt_error
  elif $sliceLength < 0 then
	"slice length cannot be negative" | halt_error
  else
	.
end
| [range(0; $series | length)]
| map($series[. : . + $sliceLength])
| map(select(. | length == $sliceLength))
```

It was fun to try out all the jq features I've never needed for simple data transformations. While the tooling here was lacking somewhat (no editor integration, etc), a deeper understanding of the breadth of jq's functionality was valuable.

_edit_: DJ Adams on Mastodon [brought to my attention](https://hachyderm.io/@qmacro/111628657965985179) the [jq-lsp](https://github.com/wader/jq-lsp) project and its corresponding [VSCode plugin](https://github.com/wader/vscode-jq). I missed the boat on it this time, but I'll check it out in the future.

## Object Oriented October

[October](https://exercism.org/blog/object-oriented-october) delved into [object-oriented](https://en.wikipedia.org/wiki/Object-oriented_programming) languages. I've got a soft spot in my heart for OO designs, which closely mirror how I visualize programs in my head. I went with [Ruby](https://www.ruby-lang.org/en/), which may sound like an odd choice.

I work at [Stripe](https://stripe.com/), home of the [largest Ruby codebase in the world](https://nitter.net/defrag_fable/status/1584594934006681600). Surely it wouldn't count as an "unfamiliar" language? While that's all true, our Ruby monolith feels very far removed from "standard" Ruby -- everything is typechecked with [Sorbet](https://sorbet.org/), there's a _lot_ of code generation, and we do a lot of magic to make everything work together and scale. Though Ruby inside and outside Stripe is ultimately the same language, working at such different scales provides vastly different experiences; I wanted to know what life was like on the outside (in the years since I'd used Ruby heavily).

Largely, it was good! Ruby itself is great and cites "programmer happiness" as a main goal, which resonated with me. I like how often I can guess the name of stdlib functions I've never used. I like how easy it is to build functional code and how ergonomic and expressive the syntax is.

That said, I was surprised at how far behind Python the developer tooling was. Maybe I've been spoiled, but having type hints in-editor and having extremely fast linting and formatting is more important to me than I realized. For a language as popular as Ruby was at its peak, I was surprised how far behind it felt in that regard.[^3] I also never quite adjusted to the optional parenthesis in function calls, which made passing functions as arguments less straightforward.

Ruby's still a great language and I'll keep using it at work, but it doesn't do anything for me that Python doesn't, at least right now.

## Nibbly November

[November](https://exercism.org/blog/nibbly-november) was the hardest month yet: assembly languages. Though it's no longer common to write these by hand, it's a useful and interesting topic to be familiar with. I selected [WebAssembly](https://webassembly.org/) for its importance to the modern and future web. While it's typically used as a compile target (and not something you write by hand), there exists [tooling](https://github.com/exercism/wasm-lib) for the [sickos](https://knowyourmeme.com/memes/sickos-haha-yes) out there.

I felt unexpectedly well prepared for this month. The syntax felt like Clojure and the language structure felt like Zachtronic's [TIS-100](https://www.zachtronics.com/tis-100/). I weirdly enjoyed having to start from scratch for every operation; it felt quaint. I'd hate it if I had to actually get anything done this way, but it was a fun curio in the meantime. With generous comments, I was able to write something nearly legible:

```wasm
(module
  (func (export "eggCount") (param $number i32) (result i32)
	(local $res i32) ;; result
	(local $remainder i32) ;; loop counter

	(loop $loop

  	;; $res =
  	(local.set $res
    	;; $res +
    	(i32.add
      	(local.get $res)
      	;; $number % 2
      	(i32.rem_u
        	(local.get $number)
        	(i32.const 2)
      	)
    	)
  	)

  	;; $number //= 2
  	;; (keep on stack)
  	(local.tee $number
    	(i32.div_u
      	(local.get $number)
      	(i32.const 2)
    	)
  	)

  	;; this will keep looping until remainder is 0
  	br_if $loop
	)

	local.get $res
  )
)
```

The biggest hurdle was the lack of docs and resources. It was hard to even tell what global functions were available. But given that I'm not actually going to be using this, once I got rolling it didn't bother me too much.

# December Diversions

[December](https://exercism.org/blog/december-diversions) wrapped the year with languages that didn't fit into other categories. Because of double dipping in [March](#mechanical-march), I needed to complete two languages this month.

I started with [Wren](https://wren.io/). Created by [Bob Nystrom](https://journal.stuffwithstuff.com/) of, among other things, [_Crafting Interpreters_](https://craftinginterpreters.com/) fame. I was charmed by its attention to detail, small footprint, and top-down design; everything seems very well thought out. That level of care is evident in the details of variable scoping and privacy rules. Its compiler is small and [heavily commented](https://github.com/wren-lang/wren/blob/93dac9132773c5bc0bbe92df5ccbff14da9d25a6/src/vm/wren_value.h#L486-L541), so it's a great learning resource if you're into language implementations.

Wren is a little rough around the edges and seems to be mostly abandoned, but I think that's fine for a toy language. No one is coming into this expecting production readiness. There's certainly space in the world for non-production languages.

### Also: Lua

My second pick this month was [Lua](https://www.lua.org/). In contrast to Wren, it's incredibly practical. Its easy embeddability means it shows up lots of places, like [Redis scripting](https://redis.io/docs/interact/programmability/eval-intro/) and [Factorio mods](https://wiki.factorio.com/Tutorial:Scripting). The object model took a little getting used to, but I can see how I'd be productive quickly. I warmed quickly to tables as a do-everything structure. The tooling was good - the package manager worked out of the box and the VSCode extension supported comment-based type annotations without fuss.

While I don't have anything I immediately need Lua for, it's another great tool to have in the box because of its widespread use.

## Wrapping it Up

![](./images/languages.png) - FIXME

I enjoyed this language tour more than I expected to. Not only did I learn some new practical skills, my horizons feel thoroughly broadened.

As for what's next, I think it's learning a lot more Rust. Its importance in the developer tooling landscape is evident at this point and I want to make sure I can read and contribute to the things I rely on.

I don't have an actual deliverable in mind, but I've got the whole [Rust book](https://doc.rust-lang.org/book/) to read, a [Rust for JS devs course](https://rustforjs.dev/) I expensed one year, and an entire Exercism track to complete. I'd like to contribute to at least one open source project (probably [Just](https://github.com/casey/just), a new favorite program of mine), but we'll see where the year takes me.

Until then, happy holidays and have a good rest of your 2023!

[^1]: Unused variables are a compiler error?? I mean come on
[^2]: I actually tried C++ first (which I hadn't written since college). It just wasn't fun, so I dropped it
[^3]: This is another way that "actual" Ruby differs from my experience within Stripe, so I'm glad I got to try it both ways
