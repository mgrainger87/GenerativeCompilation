//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2

_customFunction:
// Store link register and any callee-saved registers we're using
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Calculate int1 + int2 * 2
lsl     w4, w1, 1          // w4 = int2 * 2
add     w4, w4, w0         // w4 = int1 + w4

// Store the result in *outInt
str     w4, [x2]

// Load double1 * 2 into d2
fmov    d2, #2.0
fmul    d2, d0, d2         // d2 = double1 * 2

// Calculate double1 * 2 + double2
fadd    d2, d2, d1

// Store the result in *outDouble
str     d2, [x3]

// Restore the link register and any callee-saved registers
ldp     x29, x30, [sp], #16
ret
