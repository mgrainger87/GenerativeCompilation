//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                // Set frame pointer to current stack pointer

// Body
// Initialize *outInt = 1
mov w4, #1                 // w4 will be used to store the value of i
str w4, [x2]               // Store 1 to *outInt

// for loop: for(int i = 1; i <= int1; i++)
_loop_start:
cmp w4, w0             // Compare i with int1
bgt _loop_end          // If i > int1, exit loop

// Multiply *outInt by i
ldr w5, [x2]           // Load current value of *outInt into w5
mul w5, w5, w4         // Multiply w5 with i
str w5, [x2]           // Store the result back to *outInt

add w4, w4, #1         // Increment i
b _loop_start          // Jump back to the start of the loop

_loop_end:
// Initialize *outDouble = 0.0
fmov d4, #0.0              // d4 will hold the floating point zero value
str d4, [x3]               // Store 0.0 to *outDouble

// Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register
ret                       // Return
