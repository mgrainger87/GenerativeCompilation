//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.text
.align 2
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp
// Function body
str w0, [x2] // _outInt = int1
str d0, [x3] // _outDouble = double1
// Restore callee-saved registers
ldp x29, x30, [sp], #16
ret
