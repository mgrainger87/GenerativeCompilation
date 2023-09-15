//compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save lr and x29 to stack
stp x29, lr, [sp, #-16]!

// Update frame pointer
mov x29, sp

// Load 10.0 into d8 using fmov
mov x4, #0x4024000000000000
fmov d8, x4

// Compare double1 (d0) with 10.0
fcmp d0, d8

// If double1 < 10, then jump to .1_else
b.ge .1_else

// *outInt = int1 * int2
mul w4, w0, w1
str w4, [x2]

// *outDouble = double1
str d0, [x3]

// Restore lr and x29 from stack and return
ldp x29, lr, [sp], #16
ret

.1_else:
// int2+2
add w1, w1, #2

// Load 1.0 into d8 using fmov
mov x4, #0x3FF0000000000000
fmov d8, x4

// double1-1
fsub d0, d0, d8

// double2+1
fadd d1, d1, d8

// Call customFunction recursively
bl _customFunction

// Restore lr and x29 from stack and return
ldp x29, lr, [sp], #16
ret
