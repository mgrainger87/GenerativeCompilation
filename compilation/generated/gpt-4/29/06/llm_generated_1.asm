//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store Link Register and the registers which will be modified
stp x29, x30, [sp, #-16]!      // Save frame pointer and link register
mov x29, sp                    // Set the frame pointer

// Store the double1 value to *outDouble
str d0, [x3]                   // *outDouble = double1;

// Initialize loop counter i to 0
mov w4, #0                      // w4 will be our loop counter i

loop_start:
// Check if i < int1
cmp w4, w0                      // Compare i with int1
bge loop_end                    // If i >= int1, exit loop

// *outDouble /= double2;
ldr d5, [x3]                    // Load *outDouble into d5
fdiv d5, d5, d1                 // Divide d5 by double2
str d5, [x3]                    // Store the result back to *outDouble

// Increment loop counter i
add w4, w4, #1                  // i++
b loop_start                    // Jump to the start of the loop

loop_end:
// Set *outInt to 0
mov w5, #0                      // Load 0 into w5
str w5, [x2]                    // Store w5 to *outInt

// Restore Link Register and return
ldp x29, x30, [sp], #16         // Restore frame pointer and link register
ret                             // Return
