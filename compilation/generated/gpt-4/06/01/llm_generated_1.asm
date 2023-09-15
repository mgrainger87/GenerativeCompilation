//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register (x30) and frame pointer (x29) to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Calculate int1 + int2 * 2
lsl w4, w1, 1     // w4 = int2 * 2
add w4, w4, w0    // w4 = int1 + (int2 * 2)
str w4, [x2]      // *outInt = w4

// Calculate double1 * 2 + double2
fmov d2, #2.0     // Load immediate 2.0 to d2
fmul d3, d0, d2   // d3 = double1 * 2
fadd d3, d3, d1   // d3 = (double1 * 2) + double2
str d3, [x3]      // *outDouble = d3

// Restore link register (x30) and frame pointer (x29) from the stack
ldp x29, x30, [sp], #16
ret
