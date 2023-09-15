//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save the link register and other caller-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 (x0) is less than 5
cmp w0, #5
b.ge _else_branch

_then_branch:
// int1 + int2 -> x0 + x1
add w0, w0, w1
str w0, [x2]  // Store the result at the location pointed by outInt

// Store double2 into outDouble
str d1, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret

_else_branch:
// Prepare the arguments for the recursive call
sub w0, w0, #2  // int1 - 2

// double1 + 1.0
fmov d4, #1.0
fadd d0, d0, d4

// The rest of the arguments (int2, double2, outInt, outDouble) remain unchanged.
// Make the recursive call.
bl _customFunction

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
