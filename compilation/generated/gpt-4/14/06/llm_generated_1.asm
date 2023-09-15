//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register (return address)
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Check if int1 (w0) is negative
cmp     w0, #0
bge     .1_positive_int

// Negate int1 if negative
neg     w0, w0

.1_positive_int:
// Store the result to *outInt
str     w0, [x2]

// Load the value of double2 into a floating point register
fmov    d2, d1

// Check if double2 is negative
fcmp    d2, #0.0
bge     .2_positive_double

// Negate double2 if negative
fneg    d2, d2

.2_positive_double:
// Store the result to *outDouble
str     d2, [x3]

// Restore link register and return
ldp     x30, x29, [sp], #16
ret
