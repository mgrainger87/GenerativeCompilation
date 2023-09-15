//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Save link register to maintain the return address
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Check if int2 % 3 == 0
mov     w4, #3
udiv    w5, w1, w4
msub    w5, w5, w4, w1

cmp     w5, #0
bne     .Lnot_divisible_by_3

// If divisible by 3, int1 * int1
mul     w5, w0, w0
str     w5, [x2]
b       .Ldouble_check

.Lnot_divisible_by_3:
// If not divisible by 3, int2 * int2
mul     w5, w1, w1
str     w5, [x2]

.Ldouble_check:
// Check if double1 == double2
fcmp    d0, d1
bne     .Lnot_equal

// If equal, assign 0.0 to *outDouble
fmov    d5, #0.0
str     d5, [x3]
b       .Lend

.Lnot_equal:
// If not equal, double1 + double2
fadd    d5, d0, d1
str     d5, [x3]

.Lend:
// Restore link register and return
ldp     x29, x30, [sp], #16
ret
