# Nibbly November

## Introduction

Hey everyone. Welcome to November. I hope you’re doing well.

We’ve had a super-busy October. We just launched a big improvement to community solutions.
We now de-dup them, so the similar solutions only show once, we’ve added new ordering options, the ability to search by code, and if you check C#, you’ll see we’ve also added the ability to filter by different programming concepts.
So you can go searching for solutions that use bit shifting, recursion or anything else you fancy. We’ll be rolling that out to other tracks in the community week.

But for now, let’s focus on #12in23.
October was an interesting month, exploring object-oriented language but this month we’re going hardcore.
We’re focusing on Assembly Languages and specifically MIPS Assembly, x86-64 Assembly and WebAssembly.
As normal, Erik’s going to be talking us through what makes the languages interesting and unique.

## The badges

As always, you can earn the Nibbly November badge by completing any 5 exercises in these languages. We also have the Year-Long badge that I know many of you are working towards. For that we have 5 featured exercises for you to complete. Those are:

- **Pop Count**: count the 1 bits in a number
- **Grains**: calculate the number of grains on a chessboard with doubling squares
- **Resistor Color**: convert a resistor band's color to its numeric representation
- **Rotational Cipher**: implement the rotational cipher (aka the Caesar cipher)
- **Nucleotide Count**: compute how many times each nucleotide occurs in a DNA string

## Background

### Why name this Nibble November?

Well, as you probably know, a byte is 8 bits. And a nibble is 4 bits. The name starts to make sense if you change the y in byte to an i, which gives you bite. A nibble is then a small bite.

### What is an assembly language?

Well, let’s start with some basics. A CPU executes instructions, like “add two numbers” or “shift bits left”, etc. These instructions are known as machine code instructions and they’re nothing more than specific sequences of bits. Executing a program is “simply” (in quotes) the CPU processing and executing these bit sequences.

As directly writing out instructions as sequences of bits is cumbersome and error-prone, Kathleen and Andrew Donald Booth came up with a more human-friendly language to represent machine code instructions all the way back in 1947. Such a language that represents machine code instructions is called an assembly language. This assembly language is then converted into machine code instructions via an “assembler”.

An interesting aspect of assembly languages is that they are directly tied to a CPU architecture, although they’re usually operating system independent.

BTW, if you remember punch cards, those big pieces of card used in the earliest computers to have them execute programs, they were also an assembly language!

### How is assembly language different from the languages we now program in?

The key difference is that assembly languages are very low-level. You’ll be missing a lot of abstractions you’ve gotten used to. Classes or objects are nowhere to be found. Loops? You’ll have to write them manually via jumps. Functions? Nope! I found it very humbling to write assembly code, as you then realize how much modern languages make your life easier. But, it is also incredibly useful to write assembly code, as you’ll gain a much better understanding of how things actually work.

Fun fact: 99% of the source code of RollerCoaster Tycoon was hand-written assembly code! It’s an astonishing achievement, which you’ll come to appreciate even more once you’ve done a bit of assembly yourselves.

### Do people still write in assembly code?

Well, less than they used to. It used to be that hand-crafted assembly would often outperform compiler-generated machine code (which is one reason why the C++ languages allows one to directly embed assembly code), but compilers have become so good at generating machine code that this is rarely true anymore. That said, you’ll still find assembly language being used in performance-critical or resource-constrained environments.

## Overviews

### MIPS

- MIPS (Microprocessor without Interlocked Pipelined Stages) is a family of reduced instruction set computer (RISC) instruction set architectures
- Developed by MIPS Computer Systems and first released in 1985
- Multiple versions: MIPS I, II, III, IV, V and MIPS32/64. First two versions were 32-bit only, but MIPS III introduced 64-bit support.
- Several optional extensions, such as SIMD instructions and compression
- Very influential to later RISC architectures
- MIPS announced in 2021 that the MIPS architecture was no longer being developed and the migrated to RISC-V (which is an open-source, royalty-free architecture)
- Mostly used in embedded systems (e.g. routers) and servers (Silicon Graphics computers used it, which were famously used for SFX in movies), the NEC Cenju-4 supercomputer, Tesla’s Model S car, NASA’s New Horizons probe but also to teach assembly in universities and in several gaming consoles (e.g. original PlayStation, Playstation Portable and the Nintendo 64)

### x86-64 Assembly

- Designed by AMD and released in 1999 as the AMD64 architecture
- It’s a 64-bit version of the x86 instruction set, which goes back to 1978 when Intel launched its 8086 microprocessor. That was a 16-bit processor, but later on the 80386 added 32-bit instructions, and that instruction set has become synonymous with x86.
- The core thing 64-bit enabled was addressing more memory (32-bit addressing is limited to 4GB), which had become a bottleneck. 64-bit can, in theory, address 16 Exabytes, but currently only 48 bits are used, which allows 256 TB to be addressed (can be extended later when needed)
- AMD64 extends the x86 instruction set and was designed to be fully compatible with existing 16- and 32-bit applications through a compatibility mode
  - Intel had designed the IA-64 without AMD being involved. It was a new, very different and backwards-incompatible 64-bit instruction set. In the end, AMD64 won over and Intel implemented its own version of it (with only minor semantic differences)
- Used everywhere. From workstations to servers (including supercomputers), from embedded systems to gaming consoles (e.g. PS5 and Xbox Series X).

### WebAssembly

- Designed by the W3C, a standards body for web technologies
- Design goals are:
  - Fast, safe, and portable
  - Efficient and portable representation
- Back in the days, fast execution on the web was usually achieved via specialized browser plugins, like Flash and Silverlight, as JavaScript itself does not lend itself very well to high-performance computing. The major downsides of these plugins were that they usually had a lot of security issues and were not standardized.
  - Mozilla designed asm.js, a subset of JavaScript that aimed to allow for running code in the browser with great performance characteristics, which it achieved via type consistency (no dynamic changing of types) and no garbage collection. Languages could then compile to asm.js and still get good performance when running on the web. It was still JS though, so limited in what could be achieved. Hence, the proposal for a new language: WASM.
- Assembly-like language, in that it provides a set of instructions to be executed. Crucially, it is not tied to a specific CPU, so it is platform-agnostic and requires an implementation for each platform (a virtual machine). This means that WebAssembly is in fact bytecode, not machine code
- Statically typed (crucial difference from JS)
- Usually uses ahead-of-time or just-in-time compilation (but can be interpreted)
- Open standard and defines two things:
  - A binary format
  - A text format (which is compiled to the binary format)
- Implementations in all major browsers
- Used in many web pages that require high performance, such as Google Earth, Figma, Unity, and Autocad. Has also been gaining traction on server-side, e.g. to run microservices, run on SaaS platforms (e.g. CloudFlare workers) or in Docker

## And from a programming perspective, how do they differ?

### MIPS

- Uses a load-store architecture (a.k.a. register-register), where instructions either do memory access, or arithmetic, but they exclusively operate on data in registers

### x86-64 Assembly

- Uses a register–memory architecture, which allows operations to be performed on (or from) memory, as well as registers

### WebAssembly

- Uses stack-based programming (no registers) with the option to read data from and to memory

## What are the things that make these languages great?

### MIPS

- Small. The MIPS instruction set can fit all its instructions on a single page
- Established calling conventions help identify how to use the available registers, e.g. which to use to pass arguments and which to return results.
- Stable. Last version was released in 2014
- Widely documented, particularly in academic texts
- Lots of real world usage. Billions of devices

### x86-64 Assembly

- Whilst an extension of x64, lots of new features were added, including:
  - 64-bit integer support
  - Additional registers
  - SSE instructions (vector instructions)
  - Relative data access (more efficient when using shared libraries)
  - No-Execute Bit (security feature to prevent execution code in certain pages of memory)
- Familiar. As it extends the x86 instruction set, will be relatively easy to learn for those familiar with the x86 instruction set
  Extensive and detailed documentation
- Stable. Whilst new versions are being added regularly, the core remains extremely stable and backwards compatible

### WebAssembly

- The stack-based WebAssembly virtual machine is lean and simple compared to the assembly languages of physical processors (including RISC). This makes it relatively easy to compile for.
- WebAssembly Text Format uses S-Expression “sugar” to achieve a familiar imperative style, which is transformed to stack-based code. The form with S-Expressions is called the “sugared form” and it “desugars” to the other form that is equivalent to what is in the binary. S-expressions will be familiar to anyone who has ever worked with a LISP
- Strong Interop with JavaScript. Simple to pass data from and to JavaScript. Important caveat: WASM doesn’t (yet) allow for interacting with the DOM
- Continuously being improved. Not only the WASM virtual machines are being improved, but the standard itself is also in active development. Tons of new features being designed and worked on, such as SIMD-related instructions, garbage collection, threads, tail-call optimizations, and more
- Safe. Code is validated and run in a sandboxed environment, providing a higher degree of static validation compared to JavaScript or native assembly languages. Semantics are well-defined, making them easy to check and reason about

## Standout features

### MIPS

- Efficiency. MIPS processors are very efficient, making them great for embedded systems.
- Performance. Great performance, hence MIPS having been used in supercomputers
- Easy to learn. With few instructions and each instruction only doing one simple thing, this makes it easy to learn. Great for teaching purposes.

### x86-64 Assembly

- Powerful. x86-64 has been tweaked over decades, with tons of instructions that help with performance. An example of this is SIMD (Single Instruction, Multiple Data), which are instructions that, well, can have one instruction run in parallel on multiple data.
- Ubiquitous. Devices that run x86-64 are everywhere. Intel and AMD CPUs implement it. It has been the de-facto standard for quite a while
- Regularly updated. E.g. new vector instructions, with SSE3-5, AVX, AVX-512 and more

### WebAssembly

- Efficient. Binary format is compact and can be decoded, validated and compiled in a fast single pass. It is also streamable, which allows decoding, validation, and compilation to begin as soon as possible, before all data has been seen. And it is also parallelizable. This makes it perfect for high-performance web applications.
- Great compilation target. Allows code in many languages to run on the web. Most major languages support compiling to WebAssembly binaries, which means that your code can run on the web without needing to write JavaScript. Some languages don’t compile your code to WebAssembly, but instead compile the runtime to WebAssembly, which can then run unaltered bytecode.
- Easy to deploy and run. All you need is a virtual machine that can interpret the bytecode, and all major browsers include one.
- Not tied to the web but can also run server-side. WebAssembly System Interface (WASI) is an interface (ABI and API) designed to be portable to any platform. It is similar to POSIX (standard interfaces for Unix systems) and provides things like I/O. Security is a key part of its design, which includes sandboxing and being capability-oriented (you have to explicitly ask for permissions for things like files or sockets). WASI also has the potential to allow for easy interfacing between languages. Solomon Hykes, co-founder of Docker, wrote in 2019, "If WASM+WASI existed in 2008, we wouldn't have needed to create Docker”

## Which to choose

- If you’ve never worked with an assembly language, WebAssembly is probably the easiest language to get started with. That said, if you want to learn an assembly language that compiles to machine code, try MIPS Assembly
- If you a working on a x86-64 machine (very likely), try out x86-64 Assembly
- If you’re familiar with LISP, you’ll appreciate that WebAssembly uses S-expressions
- If you are working with web apps, WebAssembly is the most logical option
- If you care about performance, x86-64 and MIPS are great options. Or if you care about web performance, try WebAssembly
