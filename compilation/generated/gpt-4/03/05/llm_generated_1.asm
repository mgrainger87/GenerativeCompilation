//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register onto the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Calculate int1 * int2 and store in x4
mul x4, x0, x1

// Store the result at the address in x2 (outInt)
str x4, [x2]

// Calculate double1 * double2 and store in d2
fmul d2, d0, d1

// Store the result at the address in x3 (outDouble)
str d2, [x3]

// Restore link register and frame pointer, then return
ldp x30, x29, [sp], #16
ret
