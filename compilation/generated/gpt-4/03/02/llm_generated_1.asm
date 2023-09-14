//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Store the link register and other callee-saved registers if needed
stp lr, x29, [sp, #-16]!
mov x29, sp

// Multiply int1 (x0) and int2 (x1)
mul w4, w0, w1

// Store the result in the memory location pointed to by outInt (x2)
str w4, [x2]

// Multiply double1 (d0) and double2 (d1)
fmul d4, d0, d1

// Store the result in the memory location pointed to by outDouble (x3)
str d4, [x3]

// Restore the link register and other callee-saved registers
ldp lr, x29, [sp], #16

ret
