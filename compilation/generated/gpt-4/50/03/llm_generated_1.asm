//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Entry: Save necessary registers
stp x29, x30, [sp, #-16]! // Store frame pointer and link register to the stack
mov x29, sp // Set frame pointer to the current stack pointer

// Body: a + 10
add x0, x0, #10

// Exit: Restore saved registers and return
ldp x29, x30, [sp], #16 // Restore frame pointer and link register from the stack
ret
.global _customFunction
_customFunction:
// Entry: Save necessary registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Body:
// Call helperFunction with int1
bl _helperFunction // Call helperFunction. Result will be in x0.

// Store result to *outInt
str w0, [x2]

// Store double2 to *outDouble
str d1, [x3]

// Exit: Restore saved registers and return
ldp x29, x30, [sp], #16
ret
