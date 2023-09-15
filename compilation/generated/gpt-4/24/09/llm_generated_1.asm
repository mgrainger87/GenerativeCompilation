//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save necessary registers
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                // Update frame pointer

// *outDouble = 0.0
fmov d4, #0.0              // Load 0.0 into d4
str d4, [x3]               // Store d4 into *outDouble

// Initialize loop counter
mov w4, wzr                // w4 (i) = 0

1:  // Start of loop
// Check loop condition: i < int1
cmp w4, w0
b.ge 2f                    // If w4 >= w0, exit loop

// *outDouble += double1
ldr d5, [x3]               // Load *outDouble into d5
fadd d5, d5, d0            // Add double1 (d0) to d5
str d5, [x3]               // Store the result back to *outDouble

// Increment loop counter
add w4, w4, #1             // w4++
b 1b                       // Go to the start of the loop

2:  // End of loop

// *outInt = 0
mov w5, wzr                // Load 0 into w5
str w5, [x2]               // Store w5 into *outInt

// Restore registers and return
ldp x29, x30, [sp], #16    // Restore frame pointer and link register
ret                        // Return
