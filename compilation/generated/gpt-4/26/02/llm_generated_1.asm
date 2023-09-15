//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save necessary registers to the stack
stp x29, x30, [sp, #-16]!    // Save FP and LR to the stack
mov x29, sp                 // Set FP to the current SP

// *outInt = 0;
mov w4, #0                  // Use w4 as temporary register to store 0
str w4, [x2]                // Store 0 to the address in x2 (*outInt)

// for(int i = int1; i <= int2; i++) {
//     *outInt += i;
// }

mov w4, w0                  // Set w4 = int1 (initial loop counter)
1:  // Start of loop
cmp w4, w1                  // Compare i (w4) with int2 (w1)
bgt 2f                      // If i > int2, branch to end of loop
ldr w5, [x2]                // Load current value of *outInt to w5
add w5, w5, w4              // w5 = w5 + w4 (*outInt += i)
str w5, [x2]                // Store updated value of *outInt
add w4, w4, #1              // Increment i (w4)
b 1b                        // Branch back to start of loop

2:  // End of loop

// *outDouble = 0.0;
fmov d4, #0.0               // Move 0.0 to d4
str d4, [x3]                // Store 0.0 to the address in x3 (*outDouble)

// Restore registers and return
ldp x29, x30, [sp], #16     // Restore FP and LR from the stack and adjust SP
ret                         // Return
