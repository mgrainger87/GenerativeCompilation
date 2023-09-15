//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save registers that will be used
stp     x19, x20, [sp, #-16]!   // Save callee-saved registers
stp     x29, x30, [sp, #-16]!   // Save frame and link registers

mov     x19, x2                 // Save *outInt pointer to callee-saved register
mov     x20, x3                 // Save *outDouble pointer to callee-saved register

// Set *outDouble to 0.0
fmov    d2, #0.0                // Move 0.0 to floating-point register d2
str     d2, [x20]               // Store d2 value to memory address pointed by x20

// Loop from 0 to int1:
mov     w21, wzr                // Initialize loop counter w21 to 0
1:  // Start of the loop
cmp     w21, w0                 // Compare loop counter with int1
bge     2f                      // If w21 >= int1, exit loop

// *outDouble += double1
ldr     d2, [x20]               // Load value of *outDouble to d2
fadd    d2, d2, d0              // Add double1 (in d0) to d2
str     d2, [x20]               // Store the result back to *outDouble

add     w21, w21, #1            // Increment loop counter
b       1b                      // Go to start of the loop

2:  // End of loop

// Set *outInt to 0
mov     w22, wzr                // Move 0 to w22
str     w22, [x19]              // Store w22 value to memory address pointed by x19

// Epilogue: Restore saved registers and return
ldp     x29, x30, [sp], #16     // Restore frame and link registers
ldp     x19, x20, [sp], #16     // Restore callee-saved registers

ret                             // Return
