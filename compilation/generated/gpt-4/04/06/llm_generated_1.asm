//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers (we won't need to save caller-saved ones as we're not calling another function)
// And save the link register (x30)
stp x29, x30, [sp, #-16]! // Decrement stack pointer and then store frame pointer and link register on the stack
mov x29, sp               // Set frame pointer to current stack pointer

// *outInt = int1;
str w0, [x2]

// *outDouble = double2;
str d1, [x3]

// Restore saved registers and return
ldp x29, x30, [sp], #16   // Load frame pointer and link register from the stack and then increment stack pointer
ret
