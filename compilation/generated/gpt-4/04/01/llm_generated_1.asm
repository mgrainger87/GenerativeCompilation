//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store the link register (return address) to the stack
stp x30, x29, [sp, #-16]!  // Pre-indexed addressing mode
mov x29, sp  // Set frame pointer to the current stack pointer

// We don't need to save x0-x3 or d0-d1 since they are caller-saved registers
// and the function doesn't call any other function.

// *outInt = int1; => [x2] = x0
str w0, [x2]

// *outDouble = double2; => [x3] = d1
str d1, [x3]

// Restore the link register and frame pointer from the stack
ldp x30, x29, [sp], #16

ret
