//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Saving the link register (x30) and other callee-saved registers if necessary.
// Since this function is simple, we don't need to save other callee-saved registers.
stp x29, x30, [sp, #-16]!  // Push x29 (frame pointer) and x30 (link register) onto the stack.
mov x29, sp                // Set the frame pointer to the current stack pointer.

// Assign double1 to *outDouble
str d0, [x3]               // Store d0 (double1) at the memory location pointed to by x3 (outDouble).

// Initialize loop counter i
mov w4, wzr                // w4 will be our loop counter i. wzr is the zero register for 32-bit values.

loop_start:
// Check if loop counter i (w4) is less than int1 (w0).
cmp w4, w0                 // Compare w4 with w0.
b.ge loop_end              // If w4 >= w0, break out of the loop.

// *outDouble -= double2
ldr d5, [x3]               // Load *outDouble into d5.
fsub d5, d5, d1            // Subtract d1 (double2) from d5.
str d5, [x3]               // Store the result back into *outDouble.

// Increment loop counter i (w4).
add w4, w4, #1             // Increment w4.
b loop_start               // Jump back to the start of the loop.

loop_end:
// Assign 0 to *outInt
str wzr, [x2]              // Store 0 at the memory location pointed to by x2 (outInt).

// Restore link register and return.
ldp x29, x30, [sp], #16    // Pop x29 and x30 from the stack.
ret                        // Return to the caller.
