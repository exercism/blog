# Fast Bitwise method of doing Leap year.

by Ken Perry

I am sure you're asking why do this.  I mean this is such a small problem why
reduce it more.  First let me say one reason I am on Exercism is I am a 100%
Blind Senior Software Engineer of 30+ years.  I program in more languages than
I can remember yet I still find a couple that intrigue me on Exercism.  I am
really here to learn how to use my IDE's and screen reader together with each
language I use.  I could write a whole blog on the problems just getting
accessibility tools to work together with IDEs but that is not what this blog
is about. 

I was working my way through Python writing the shortest complicated unique
answers I could come up with for each exercise when #48in24 came out.  I

thought it would be fun to continue to write the shortest fun answers for the challenge as well.

Some languages are harder to do that in than others. 

After I came up with the one line logic wise method that I think everyone was
doing:

``` Return ((year % 4) == 0 and ((year%100) !=0 or (year %400 ) ==0)){

```

I tried writing it in MIPS, but it was overly complicated.  I did some

searching and found someone on Stack Overflow explaining how to do Leap year
with bitwise operations rather than all modulus and logic operators.  Not

only that but it used numbers smaller than a byte which improved the

performance more and made it work better on 8-bit chips.  

With the Stack Overflow description of the solution in mind I figured out how
to write it in MIPS and then I changed all my other languages that could do it

with bitwise operators to the same method.  That included languages like
Javascript, C, C++ X86 Assembler, and others.

The folks here at Exercism asked me to write it up and now without further
ramblings here is the solution I found and converted to work with all these
languages.

## Bit Method Overview

The bit method takes advantage of bitwise operations and factors of the larger
numbers to efficiently check for leap years.

The conditions defined by the Exercism projects are:

- on every year that is evenly divisible by 4
-   except every year that is evenly divisible by 100
-     unless the year is also evenly divisible by 400

AS the code above shows this can be done in one line using logical operators
and division with modulus.  Now let's see how it looks if we do it by
replacing two of the modulus operators with bitwise and Javascript and
re-writing it.

```
/**
 * Function to test if a given year is a leap year using the bit method.
 * @param {number} year - The year to be tested.
 * @returns {Boolean} - True if it's a leap year, false otherwise.
 */
function isLeapYear(year) {
    // Check if it's a leap year using bitwise operations
    return (year & 3) === 0 && ((year % 25) !== 0 || (year & 15) === 0).
}
   ```
   
Wait a second, in the above conditions we were supposed to test for 4, 100,
and 400.  Where did 3, 15, and 25 come from and how does this all work?

## Divisible by 4 (year % 4 == 0):

To check if a number is divisible by 4 using bitwise AND, we use 3 as the
mask. Why 3? The binary representation of 3 is 11. When you perform a bitwise
AND with 3, you are considering only the last two bits of the binary
representation of the number. If those last two bits are both 0, it indicates
divisibility by 4.

### Example:
2024 (binary: 11111110000) & 3 (binary: 11) = 0

## Not Divisible by 100 (year % 100 != 0):

The following is quoted from the Stack Overflow article.  I just couldn't explain it any better.  See the end of the blog for the link to that article.

>The 100th year test utilizes modulo 25 instead of modulo 100. We can do this because 100 factors go out to 2 x 2 x 5 x 5. Because the 4th year test already checks for factors of 4, we can eliminate that factor from 100, leaving 25. This optimization is insignificant to nearly every CPU implementation (as both 100 and 25 fit in 8-bits).
>The 400th year test utilizes & 15 which is equivalent to modulo 16. Again, we can do this because 400 factors out to 2 x 2 x 2 x 2 x 5 x 5. We can eliminate the factor of 25 which is tested by the 100th year test, leaving 16. We cannot further reduce 16 because 8 is a factor of 200, so removing any more factors would produce an unwanted positive for a 200th year.


This condition involves two checks:

(year % 25) !== 0: The binary representation of 25 is 11001. Using 15 (binary: 1111) as the mask for the last four bits ensures that at least one of the last two bits (bits 2 to 5) is not 0.
(year & 15) === 0: This check ensures that the last four bits (bits 0 to 3) are all 0.

### Example:

2024 (binary: 11111110000) & 15 (binary: 1111) = 0

Divisible by 400 (year % 400 == 0):

This condition is implicitly covered by the previous condition. If a year is
divisible by 100 but not by 25 (the last two bits are not all 0), it is still
a leap year if it is divisible by 400. 

To wrap it all up. The choices of 3, 15, and
25 as masks in the bit method are based on the binary representations of the
factors of the original numbers.

Now that you have that down let's see how it looks in C and MIPS Assembler just for fun.

## C Version

```
#include <stdbool.h>

/**
 * Function to test if a given year is a leap year using the bit method.
 * @param year - The year to be tested.
 * @return true if it's a leap year, false otherwise.
 */
bool isLeapYear(int year) {
    return (year & 3) == 0 && ((year % 25) != 0 || (year & 15) == 0);
}
```

## MIPS Assembly Version

```
# Assume the year is in $a0 register
# Assume the return will be in $v0 register 

isLeapYear:
#set return to 0 for false
li $v0, 0

        and $t0, $a0, 3 #4 mod = 0
        bnez $t0, end #not leap
        
        li $t0, 25 #mod 100
        div $a0, $t0
        mfhi $t0
        bnez $t0, leapYear

        and $t0, $a0, 15        # Check if year & 15 == 0
        beqz $t0, leapYear

j end # not leap

leapYear:
        li $v0, 1 #sset true
    end:
        jr $ra
```

In the C and MIPS assembly versions, the leap year logic is expressed
similarly to the JavaScript version, emphasizing the consistency of the bit
method across different programming languages.


Now go forth and find a better, smaller or faster way if you can.  


Quoted references from:
[Stack Overflow](https://stackoverflow.com/questions/3220163/how-to-find-leap-year-programmatically-in-c/11595914#11595914)
