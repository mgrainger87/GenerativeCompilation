//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save FP and LR to stack
mov x29, sp                // Set FP to current SP

// *outInt = int1;
str w0, [x2]

// for(int i = 0; i < int2; i++)
mov w8, #0                 // w8 will hold the loop counter i
1:                            // Local label for loop start
cmp w8, w1                 // Compare i (in w8) with int2
b.ge 2f                    // If i >= int2, exit loop

// *outInt *= 2;
ldr w9, [x2]               // Load *outInt to w9
lsl w9, w9, #1             // Multiply w9 by 2 (bitwise left shift by 1)
str w9, [x2]               // Store the result back to *outInt

add w8, w8, #1             // Increment i
b 1b                       // Jump back to the start of the loop

2:                            // Local label for loop end

// *outDouble = 0.0;
fmov d8, #0.0              // Move 0.0 to floating-point register d8
str d8, [x3]               // Store d8 to *outDouble

// Epilogue
ldp x29, x30, [sp], #16    // Restore FP and LR from stack and adjust SP
ret
