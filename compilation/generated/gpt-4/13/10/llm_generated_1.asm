//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and frame pointer
stp x29, x30, [sp, #-16]!  // Store pair to stack (pre-index)
mov x29, sp                // Set the frame pointer

// Compare int1 and int2
cmp w0, w1                 // Compare int1 (x0) and int2 (x1)

// If they are not equal, branch to else part
b.ne 1f

// int1 == int2
mul w4, w0, w1             // Multiply int1 and int2, result in w4
str w4, [x2]               // Store result to *outInt

fadd d4, d0, d1            // Add double1 and double2, result in d4
str d4, [x3]               // Store result to *outDouble

// Restore the link register and frame pointer, then return
b 2f

1:  // Else part
mov w4, #0                 // Set w4 to 0
str w4, [x2]               // Store 0 to *outInt

fmov d4, #0.0              // Set d4 to 0.0
str d4, [x3]               // Store 0.0 to *outDouble

2:  // Exit
// Restore link register and frame pointer
ldp x29, x30, [sp], #16    // Load pair from stack (post-index)
ret                        // Return
