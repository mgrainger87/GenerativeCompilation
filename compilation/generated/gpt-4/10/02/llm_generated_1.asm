//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=2
.globl _customFunction
.align 4
_customFunction:
// Store the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Integer operations
add w4, w0, w1         // w4 = int1 + int2
add w4, w4, #5         // w4 = w4 + 5
str w4, [x2]           // Store the result at the location pointed by outInt

// Floating-point operations
fmov d2, #5.0          // Load 5.0 into d2
fadd d3, d0, d1        // d3 = double1 + double2
fadd d3, d3, d2        // d3 = d3 + 5.0 (corrected this line)
str d3, [x3]           // Store the result at the location pointed by outDouble

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
