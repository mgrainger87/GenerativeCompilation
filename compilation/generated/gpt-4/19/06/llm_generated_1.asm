//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Save link register (return address) to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Calculate int2 % 3
mov w4, #3
sdiv w5, w1, w4
msub w5, w5, w4, w1

// Compare int2 % 3 to 0
cmp w5, #0

// Depending on the comparison, either int1 * int1 or int2 * int2
csel w5, w0, w1, eq
madd w5, w5, w5, wzr

// Store the result to *outInt
str w5, [x2]

// Compare double1 and double2
fcmp d0, d1

// If double1 is not equal to double2, then double1 + double2 else 0.0
fmov d3, #0.0
fadd d4, d0, d1
fcsel d3, d3, d4, ne

// Store the result to *outDouble
str d3, [x3]

// Restore link register and frame pointer
ldp x30, x29, [sp], #16

// Return from the function
ret
