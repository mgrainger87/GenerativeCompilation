//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Storing callee-saved registers
stp x19, x20, [sp, #-16]!
stp d8, d9, [sp, #-16]!

// *outInt = int1; (dereferencing the pointer and storing the value)
str w0, [x2]

// *outDouble = double1; (dereferencing the pointer and storing the value)
str d0, [x3]

// Restoring callee-saved registers
ldp d8, d9, [sp], #16
ldp x19, x20, [sp], #16

ret
