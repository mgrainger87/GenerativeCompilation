//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save the link register to the stack
stp x30, xzr, [sp, #-16]!

// Store int2 to *outInt
str w1, [x2]

// Store double1 to *outDouble
str d0, [x3]

// Restore the link register from the stack and return
ldp x30, xzr, [sp], #16
ret
