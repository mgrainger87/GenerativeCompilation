//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align  2
_customFunction:
// Save the link register to preserve the return address.
stp x30, x29, [sp, #-16]!  // push lr and fp onto the stack
mov x29, sp                // Set frame pointer

// Check if int1 (w0) is less than 5
cmp w0, #5
bge .else_part             // branch to else part if w0 >= 5

// then-part
add w4, w0, w1             // w4 = int1 + int2
str w4, [x2]               // *outInt = w4
fmov d3, d1                // d3 = double2
str d3, [x3]               // *outDouble = d3

// Restore link register and return
ldp x30, x29, [sp], #16    // pop lr and fp from the stack
ret

.else_part:
// Prepare arguments for recursive call

// int1-2 -> w0
sub w0, w0, #2

// double1+1 -> d0
fmov d2, #1.0
fadd d0, d0, d2

// Call customFunction recursively
bl _customFunction

// Restore link register and return
ldp x30, x29, [sp], #16    // pop lr and fp from the stack
ret
