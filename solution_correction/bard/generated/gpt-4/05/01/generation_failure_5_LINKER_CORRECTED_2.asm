//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 4
_customFunction:
// Save x19, x20 (two callee-saved registers)
// and the link register (lr) to stack.
stp x19, x20, [sp, #-16]!
stp x29, x30, [sp, #-16]! // x30 is the link register

// Set frame pointer (fp) for better debugging
mov x29, sp

// Move x0 (int1) to the location pointed to by x2 (outInt)
str w0, [x2]

// Move d0 (double1) to the location pointed to by x3 (outDouble)
str d0, [x3]

// Restore callee-saved registers and the link register from stack
ldp x29, x30, [sp], #16
ldp x19, x20, [sp], #16

ret
