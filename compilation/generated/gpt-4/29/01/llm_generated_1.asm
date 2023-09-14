//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and link register
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register to stack
mov x29, sp                 // Set frame pointer to current stack pointer

// *outDouble = double1;
str d0, [x3]

// for(int i = 0; i < int1; i++)
mov w4, wzr                 // Set w4 (our loop counter i) to 0
.loop_start:
cmp w4, w0                  // Compare i (w4) to int1 (w0)
b.ge .loop_end              // If i >= int1, branch to loop_end

// *outDouble /= double2;
ldr d5, [x3]                // Load *outDouble into d5
fdiv d5, d5, d1             // Divide d5 by double2 (d1)
str d5, [x3]                // Store the result back to *outDouble

add w4, w4, #1              // Increment i (w4)
b .loop_start               // Go to the start of the loop

.loop_end:
// *outInt = 0;
str wzr, [x2]               // Store zero to *outInt

// Restore saved registers and return
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret                         // Return
