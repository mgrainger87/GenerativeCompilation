//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.text
.align 2
.global _customFunction
_customFunction:
// x0 holds int1
// x1 holds int2
// d0 holds double1
// d1 holds double2
// x2 holds address of _outInt
// x3 holds address of _outDouble
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp d8, d9, [sp, #-16]!
stp d10, d11, [sp, #-16]!
stp d12, d13, [sp, #-16]!

// Store int1 to address in x2
str w0, [x2]

// Store double1 to address in x3
str d0, [x3]

// Restore callee-saved registers
ldp d12, d13, [sp], #16
ldp d10, d11, [sp], #16
ldp d8, d9, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16

// Return
ret
