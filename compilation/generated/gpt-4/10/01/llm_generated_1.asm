//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

// Align the function to 4 bytes boundary
.align 4

_customFunction:
// Prologue: Save the link register x30 (LR) to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compute int1 + int2 + 5 and store it in outInt
add w4, w0, w1         // w4 = int1 + int2
add w4, w4, #5         // w4 = w4 + 5
str w4, [x2]           // *outInt = w4

// Load immediate floating point value 5.0 into d2
fmov d2, #5.0

// Compute double1 + double2 + 5.0 and store it in outDouble
fadd d3, d0, d1        // d3 = double1 + double2
fadd d3, d3, d2        // d3 = d3 + 5.0
str d3, [x3]           // *outDouble = d3

// Epilogue: Restore the link register x30 (LR) from the stack and return
ldp x30, x29, [sp], #16
ret
