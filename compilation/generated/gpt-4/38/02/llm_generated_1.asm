//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and link register (lr)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare int2 with 5
cmp w1, #5

// If int2 < 5, do direct calculations
blt .1_less_than_5

// Else, do recursive call
sub w1, w1, #2 // int2 = int2 - 2

// Load 1.0 into a floating-point register, then subtract from d1
fmov d2, #1.0
fsub d1, d1, d2 // double2 = double2 - 1.0

bl _customFunction // Recursive call
ldp x29, x30, [sp], #16
ret

.1_less_than_5:
str w0, [x2] // *outInt = int1
fadd d2, d0, d1 // d2 = double1 + double2
str d2, [x3] // *outDouble = d2
ldp x29, x30, [sp], #16
ret
