//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Save the link register (x30) to the stack.
stp x30, x29, [sp, #-16]!  // Store pair of 64-bit registers and update the stack pointer.
mov x29, sp               // Set up the frame pointer.

// Function body
// *outInt = int1;
str w0, [x2]              // Store 32-bit int (int1) at address in x2 (outInt).

// *outDouble = double2;
str d1, [x3]              // Store 64-bit double (double2) at address in x3 (outDouble).

// Restore the link register and return.
ldp x30, x29, [sp], #16   // Load pair of 64-bit registers and update the stack pointer.
ret                       // Return from function.
