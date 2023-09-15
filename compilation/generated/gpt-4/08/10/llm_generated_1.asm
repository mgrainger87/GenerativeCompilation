//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save the link register to the stack
stp x30, xzr, [sp, #-16]!

// Calculate int1 * int1
mul w4, w0, w0

// Store the result to the location pointed by outInt
str w4, [x2]

// Calculate double2 * double2
fmul d4, d1, d1

// Store the result to the location pointed by outDouble
str d4, [x3]

// Restore the link register and return
ldp x30, xzr, [sp], #16
ret
