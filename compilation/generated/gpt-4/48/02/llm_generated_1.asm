//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Function prologue: save frame pointer (x29) and link register (x30/lr)
stp x29, x30, [sp, #-16]!  // Save pair to stack and adjust stack pointer
mov x29, sp               // Set frame pointer to current stack pointer

// negate the value of a (passed in x0)
neg w0, w0                // w0 = -w0

// Function epilogue: restore frame pointer and link register
ldp x29, x30, [sp], #16  // Load pair from stack and adjust stack pointer
ret

.global _customFunction
_customFunction:
// Function prologue: save frame pointer (x29) and link register (x30/lr)
stp x29, x30, [sp, #-16]!
mov x29, sp               // Set frame pointer to current stack pointer

// Save callee saved registers (x19 and x20) which we will use for temporary storage
stp x19, x20, [sp, #-16]!
sub sp, sp, #16           // Adjust stack pointer

// Store parameters for later use
mov x19, x2               // outInt
mov x20, x3               // outDouble

// Call helperFunction with int2 (x1)
bl _helperFunction        // Call helperFunction. Result is in x0

// Store the result to outInt
str w0, [x19]

// Store double1 (d0) to outDouble
str d0, [x20]

// Function epilogue
add sp, sp, #16           // Adjust stack pointer
ldp x19, x20, [sp], #16  // Restore callee saved registers
ldp x29, x30, [sp], #16  // Restore frame pointer and link register
ret
