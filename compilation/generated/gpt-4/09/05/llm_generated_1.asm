//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save necessary registers to the stack.
// We're going to use x4, x5, and d2 in our operations, so we need to save them.
stp x29, x30, [sp, #-16]!  // Save frame and link register.
mov x29, sp  // Set frame pointer.
stp x4, x5, [sp, #-16]!
stp d2, d3, [sp, #-16]!

// Operation 1: Square int2 and store in *outInt.
mul w4, w1, w1  // w4 = int2 * int2.
str w4, [x2]  // *outInt = w4.

// Operation 2: Square double1 and store in *outDouble.
fmul d2, d0, d0  // d2 = double1 * double1.
str d2, [x3]  // *outDouble = d2.

// Restore saved registers and return.
ldp d2, d3, [sp], #16
ldp x4, x5, [sp], #16
ldp x29, x30, [sp], #16
ret
