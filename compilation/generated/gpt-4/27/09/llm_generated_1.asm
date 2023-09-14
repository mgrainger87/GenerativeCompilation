//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Function Prologue
stp x29, x30, [sp, #-16]!   // Store frame pointer and return address
mov x29, sp                // Set the frame pointer

// Initialize *outDouble = 1.0
fmov d4, #1.0              // Load 1.0 into a temporary double register d4
str d4, [x3]               // Store d4 to *outDouble

// Setup loop
mov w4, wzr                // Initialize i to 0
b 2f                       // Jump to loop check

1:  // Loop body
fmul d4, d0, d1            // d4 = double1 * double2
ldr d5, [x3]               // Load current *outDouble value into d5
fmul d5, d4, d5            // Multiply d4 with d5
str d5, [x3]               // Store result back to *outDouble
add w4, w4, #1             // Increment i

2:  // Loop condition check
cmp w4, w0                 // Compare i with int1
blt 1b                     // If i < int1, loop

// *outInt = 0
mov w5, wzr                // Move 0 to w5
str w5, [x2]               // Store w5 to *outInt

// Function Epilogue
ldp x29, x30, [sp], #16    // Restore frame pointer and return address
ret                        // Return
