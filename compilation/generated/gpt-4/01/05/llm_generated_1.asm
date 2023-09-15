//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
.global _customFunction
_customFunction:
// Save lr to the stack
sub sp, sp, #16       // Decrement stack pointer by 16 bytes
str lr, [sp]         // Store lr at the new top of the stack

// Add int1 and int2
add w4, w0, w1       // w4 = int1 + int2

// Store result to *outInt
str w4, [x2]

// Add double1 and double2
fadd d2, d0, d1      // d2 = double1 + double2

// Store result to *outDouble
str d2, [x3]

// Restore lr from the stack
ldr lr, [sp]         // Load lr from the top of the stack
add sp, sp, #16      // Increment stack pointer by 16 bytes

// Return from function
ret
