//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.global _customFunction
_customFunction:
// Save the link register (x30) and FP (x29) to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform the integer addition
add w4, w0, w1       // w4 = int1 + int2
add w4, w4, #5       // w4 += 5
str w4, [x2]         // *outInt = w4

// Load the immediate floating point value 5.0 into d4
fmov d4, #5.0
// Perform the floating point addition
fadd d3, d0, d1      // d3 = double1 + double2
fadd d3, d3, d4      // d3 += 5.0 (corrected)
str d3, [x3]         // *outDouble = d3

// Restore the link register (x30) and FP (x29) from the stack
ldp x29, x30, [sp], #16
ret
