//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save link register and other required registers
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                 // Set the frame pointer

// Compute int2 * int2
mul w4, w1, w1              // w4 = int2 * int2

// Store result in *outInt
str w4, [x2]

// Compute double1 * double1
fmul d4, d0, d0             // d4 = double1 * double1

// Store result in *outDouble
str d4, [x3]

// Epilogue: Restore link register and other registers and return
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret
