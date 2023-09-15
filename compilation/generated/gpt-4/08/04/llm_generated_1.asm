//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// Save frame and link registers
stp     x29, x30, [sp, #-16]!       // Save frame pointer and link register to the stack
mov     x29, sp                     // Update frame pointer

// *outInt = int1 * int1;
mul     w4, w0, w0                  // w4 = int1 * int1
str     w4, [x2]                    // Store the result at the address pointed by outInt

// *outDouble = double2 * double2;
fmul    d4, d1, d1                  // d4 = double2 * double2
str     d4, [x3]                    // Store the result at the address pointed by outDouble

// Restore frame and link registers and return
ldp     x29, x30, [sp], #16         // Restore frame pointer and link register
ret                                 // Return to caller
