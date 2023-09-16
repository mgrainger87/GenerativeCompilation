//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp                // Set up frame pointer

// *outDouble = double1;
str d0, [x3]               // Store d0 (double1) at address in x3 (outDouble)

// for(int i = 0; i < int1; i++)
mov w4, #0                 // w4 is our loop counter (i)
1:                             // Local label for loop start
cmp w4, w0                 // Compare i (w4) with int1 (w0)
b.ge 2f                    // If i >= int1, exit loop

// *outDouble -= double2;
ldr d2, [x3]               // Load current value of *outDouble into d2
fsub d2, d2, d1            // Subtract double2 (d1) from d2
str d2, [x3]               // Store the result back into *outDouble

add w4, w4, #1             // Increment loop counter (i)
b 1b                       // Jump to start of loop

2:                             // Local label for loop end

// *outInt = 0;
mov w5, #0                 // Move 0 into w5
str w5, [x2]               // Store w5 at address in x2 (outInt)

ldp x29, x30, [sp], #16    // Restore frame pointer and link register
ret                        // Return
