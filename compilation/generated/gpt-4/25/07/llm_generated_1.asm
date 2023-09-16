//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save callee-saved registers and stack setup
stp x29, x30, [sp, #-16]!     // Save frame pointer and link register
mov x29, sp                  // Set up frame pointer

// *outDouble = double1
str d0, [x3]                 // Store double1 to *outDouble

// Initialize loop counter i
mov w4, wzr                  // Set w4 (our loop counter) to zero

loop_start:
// Check loop condition: i < int1
cmp w4, w0                  // Compare i (w4) with int1 (x0)
b.ge loop_end               // If i >= int1, exit loop

// *outDouble -= double2
ldr d5, [x3]                // Load *outDouble value into d5
fsub d5, d5, d1             // Subtract double2 from d5
str d5, [x3]                // Store result back to *outDouble

// Increment loop counter i
add w4, w4, #1              // Increment w4 (i) by 1
b loop_start                // Jump back to start of loop

loop_end:
// *outInt = 0
str wzr, [x2]               // Store zero to *outInt

// Epilogue: Restore callee-saved registers and return
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret                         // Return from function
