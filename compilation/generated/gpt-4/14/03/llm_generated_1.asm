//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// Save the link register and stack pointer to the stack
stp     x29, lr, [sp, #-16]!
mov     x29, sp

// Check if int1 is negative
cmp     w0, #0
blt     .1_neg_int1

// If positive or zero, directly move it to the location pointed by outInt
str     w0, [x2]
b       .2_next

.1_neg_int1:
// Negate int1 and store the result in the location pointed by outInt
neg     w0, w0
str     w0, [x2]

.2_next:
// Check if double2 is negative
fcmp    d1, #0.0
blt     .3_neg_double2

// If positive or zero, directly move it to the location pointed by outDouble
str     d1, [x3]
b       .4_end

.3_neg_double2:
// Negate double2 and store the result in the location pointed by outDouble
fneg    d1, d1
str     d1, [x3]

.4_end:
// Restore the link register and stack pointer, then return
ldp     x29, lr, [sp], #16
ret
