//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Preserve the link register (lr) on the stack
stp     lr, x29, [sp, #-16]!
mov     x29, sp

// Calculate int1 * int2 and store the result at the location pointed by outInt
mul     w4, w0, w1          // w4 = int1 * int2
str     w4, [x2]            // *outInt = w4

// Calculate double1 * double2 and store the result at the location pointed by outDouble
fmul    d4, d0, d1          // d4 = double1 * double2
str     d4, [x3]            // *outDouble = d4

// Restore the link register (lr) from the stack and return
ldp     lr, x29, [sp], #16
ret
