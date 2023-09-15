//compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!   // Store frame pointer and link register
mov x29, sp                 // Set frame pointer to current stack pointer

// Initialize *outDouble = 0.0
fmov d1, #0.0               // Load 0.0 into floating point register d1
str d1, [x3]                // Store d1 value to *outDouble

// Initialize loop counter: int i = 0
mov w4, #0                 // w4 will be our loop counter 'i'

loop_start:
// Check loop condition: i < int1
cmp w4, w0                 // Compare i with int1
bge loop_end               // If i >= int1, exit loop

// Loop body: *outDouble += double1
ldr d1, [x3]               // Load *outDouble to d1
fadd d1, d1, d0            // Corrected here: d1 = d1 + d0 (use d0 instead of v0)
str d1, [x3]               // Store d1 back to *outDouble

// Increment loop counter: i++
add w4, w4, #1             // Increment i
b loop_start               // Go to start of loop

loop_end:
// Initialize *outInt = 0
mov w5, #0                 // Load 0 into w5
str w5, [x2]               // Store w5 to *outInt

// Epilogue
ldp x29, x30, [sp], #16    // Restore frame pointer and link register
ret                        // Return
