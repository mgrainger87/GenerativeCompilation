//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store the link register for later
stp x30, x29, [sp, #-16]!
mov x29, sp

// Perform integer addition
add w4, w0, w1
// Store the result at the memory location pointed to by outInt (x2)
str w4, [x2]

// Perform floating point addition
fadd d4, d0, d1
// Store the result at the memory location pointed to by outDouble (x3)
str d4, [x3]

// Restore link register and return
ldp x30, x29, [sp], #16
ret
