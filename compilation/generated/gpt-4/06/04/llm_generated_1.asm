//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x29, x30, [sp, #-16]!  // FP (x29) and LR (x30)
add x29, sp, #16           // Set up frame pointer (x29) to point to the saved LR

// int1 + int2 * 2
lsl w4, w1, #1             // Multiply int2 by 2 and store in w4
add w4, w4, w0             // Add int1 to result
str w4, [x2]               // Store result in *outInt

// double1 * 2 + double2
fmov d2, #2.0              // Load 2.0 into d2
fmul d3, d0, d2            // Multiply double1 by 2.0 and store in d3
fadd d3, d3, d1            // Add double2 to result
str d3, [x3]               // Store result in *outDouble

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
