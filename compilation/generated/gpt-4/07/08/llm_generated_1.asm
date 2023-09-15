//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register to the stack
mov x29, sp                // Set up the frame pointer

// Calculate int1 * 3
lsl w4, w0, 1              // w4 = int1 * 2
add w4, w4, w0             // w4 = w4 + int1 = int1 * 3

// Subtract int2 from the result (int1 * 3)
sub w4, w4, w1             // w4 = w4 - int2

// Store the result at *outInt
str w4, [x2]

// Multiply double2 by 3
fmov d2, #3.0              // Load immediate floating point value 3.0 into d2
fmul d2, d1, d2            // d2 = double2 * 3

// Subtract the result from double1
fsub d2, d0, d2            // d2 = double1 - d2

// Store the result at *outDouble
str d2, [x3]

// Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register from the stack
ret                       // Return to the caller
