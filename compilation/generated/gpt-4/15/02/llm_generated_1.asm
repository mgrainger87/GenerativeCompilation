//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!       // Save the frame pointer and link register onto the stack.
mov x29, sp                     // Update the frame pointer.

// Check if double1 == 0.0
fcmp d0, #0.0                   // Compare double1 with 0.0

// Use branching based on the result of the comparison
beq 1f                          // If equal, jump to the label "1" (the true branch of the if statement)

// Else branch (double1 != 0.0)
sub w4, w0, w1                  // int1 - int2
str w4, [x2]                    // Store the result at the address pointed by outInt
fmov d2, d0                     // Move double1 to d2
str d2, [x3]                    // Store d2 at the address pointed by outDouble
b 2f                            // Jump to the end label "2"

1:  // True branch (double1 == 0.0)
add w5, w0, w1                  // int1 + int2
str w5, [x2]                    // Store the result at the address pointed by outInt
fmov d2, #1.0                   // Load 1.0 into d2
str d2, [x3]                    // Store d2 at the address pointed by outDouble

2:  // End of the function
ldp x29, x30, [sp], #16         // Restore the frame pointer and link register from the stack.
ret                             // Return from the function.
