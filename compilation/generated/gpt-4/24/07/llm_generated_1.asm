//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!   // Save frame and link register
mov x29, sp                // Set frame pointer

// Initialize *outDouble = 0.0
fmov d4, #0.0              // Move 0.0 into d4
str d4, [x3]               // Store d4 to *outDouble address

// Initialize loop counter i
mov w4, #0                 // w4 will be our loop counter i

1:  // Loop start
cmp w4, w0                 // Compare i with int1
b.ge 2f                    // If i >= int1, branch to label 2 (end of loop)

// Inside loop: *outDouble += double1
ldr d5, [x3]               // Load *outDouble into d5
fadd d5, d5, d0            // Add double1 to d5
str d5, [x3]               // Store the result back to *outDouble

// Increment loop counter and go back to the start
add w4, w4, #1             // Increment i
b 1b                       // Go back to label 1 (loop start)

2:  // Loop end

// Set *outInt = 0
mov w5, #0                 // w5 = 0
str w5, [x2]               // Store w5 to *outInt

// Epilogue
ldp x29, x30, [sp], #16    // Restore frame and link register
ret
