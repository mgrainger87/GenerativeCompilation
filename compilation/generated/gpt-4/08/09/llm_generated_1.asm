//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and any other registers we might use
stp x29, x30, [sp, #-16]!  // Push frame pointer and link register to stack
mov x29, sp                // Update frame pointer

// *outInt = int1 * int1;
mul w4, w0, w0             // w4 = w0 * w0
str w4, [x2]               // Store result to memory location pointed by outInt

// *outDouble = double2 * double2;
fmul d4, d1, d1            // d4 = d1 * d1
str d4, [x3]               // Store result to memory location pointed by outDouble

// Restore link register and return
ldp x29, x30, [sp], #16    // Pop frame pointer and link register from stack
ret                        // Return to caller
