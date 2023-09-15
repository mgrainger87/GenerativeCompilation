//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Save link register (return address) to stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// int1 + int2 * 2
lsl w4, w1, 1     // Multiply int2 by 2
add w4, w4, w0    // Add result to int1
str w4, [x2]      // Store result at address pointed by outInt

// double1 * 2 + double2
fmov d2, #2.0     // Load 2.0 into d2
fmul d3, d0, d2   // Multiply double1 by 2.0
fadd d3, d3, d1   // Add result to double2
str d3, [x3]      // Store result at address pointed by outDouble

// Restore link register and return
ldp x29, x30, [sp], #16
ret
