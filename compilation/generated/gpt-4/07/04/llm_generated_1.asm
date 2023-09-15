//compiler_errors=0,linker_errors=1,execution_errors=1,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Preserve link register
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Compute int1 * 3
mov     w4, w0            // Move int1 to w4
mov     w5, #3            // Load 3 into w5
mul     w4, w4, w5        // Multiply w4 by w5, store result in w4

// Subtract int2 from result
sub     w4, w4, w1        // Subtract w1 (int2) from w4

// Store the result in *outInt
str     w4, [x2]

// Compute double2 * 3
fmov    d4, d1            // Move double2 to d4
fmov    d5, #3.0          // Load 3.0 into d5
fmul    d4, d4, d5        // Multiply d4 by d5

// Subtract the result from double1
fsub    d0, d0, d4        // Subtract d4 from d0

// Store the result in *outDouble
str     d0, [x3]

// Restore link register and return
ldp     x30, x29, [sp], #16
ret
