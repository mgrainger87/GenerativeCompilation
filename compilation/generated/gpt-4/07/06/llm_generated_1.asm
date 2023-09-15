//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Entry
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register on the stack
mov x29, sp                  // Set frame pointer for this function

// *outInt = int1 * 3 - int2;
// int1 is in x0, int2 is in x1, outInt is in x2
mov w4, #3                   // Load 3 into w4
mul w4, w0, w4               // w4 = int1 * 3
sub w4, w4, w1               // w4 = w4 - int2
str w4, [x2]                 // Store w4 at the address pointed to by outInt

// *outDouble = double1 - double2 * 3;
// double1 is in d0, double2 is in d1, outDouble is in x3
fmov d2, #3.0                // Load 3.0 into d2
fmul d2, d1, d2              // d2 = double2 * 3.0
fsub d2, d0, d2              // d2 = double1 - d2
str d2, [x3]                 // Store d2 at the address pointed to by outDouble

// Exit
ldp x29, x30, [sp], #16      // Restore frame pointer and link register from the stack
ret                         // Return to the caller
