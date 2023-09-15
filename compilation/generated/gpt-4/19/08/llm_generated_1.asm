//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save callee-saved registers and link register
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x29, x30, [sp, #-16]!
add x29, sp, #0

// Check if int2 % 3 == 0
mov w19, #3
udiv w20, w1, w19
msub w21, w20, w19, w1
cmp w21, #0

// Calculate int1*int1 and int2*int2
mul w22, w0, w0
mul w23, w1, w1

// Choose which result to store based on the result of the comparison
csel w22, w22, w23, eq
str w22, [x2]   // Store the result at the memory location pointed to by outInt

// Check if double1 == double2
fcmp d0, d1

// Calculate double1 + double2
fadd d2, d0, d1

// Load immediate 0.0 into d3 for comparison
movz x20, #0
fmov d3, x20

// Choose which result to store based on the result of the floating point comparison
fcsel d2, d3, d2, eq
str d2, [x3]   // Store the result at the memory location pointed to by outDouble

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
