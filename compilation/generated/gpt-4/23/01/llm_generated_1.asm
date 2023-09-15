//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp                // Set up new frame pointer

// 1. *outInt = int1;
str w0, [x2]

// 2. Loop
mov w4, wzr                // w4 will be used for 'i'
1:  cmp w4, w1                 // Compare 'i' with 'int2'
b.ge 2f                    // If 'i' >= 'int2', exit loop

// Loop body
ldr w5, [x2]               // Load *outInt into w5
lsl w5, w5, #1             // Multiply by 2 (left shift by 1)
str w5, [x2]               // Store back to *outInt

add w4, w4, #1             // Increment 'i'
b 1b                       // Repeat loop

2:  // End of loop

// 3. *outDouble = 0.0;
fmov d4, #0.0              // Move 0.0 into d4
str d4, [x3]               // Store d4 into *outDouble

// Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register
ret                       // Return to caller
