//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and other caller-saved registers if necessary
stp x29, x30, [sp, #-16]!   // Store pair of registers to the stack (fp and lr)
mov x29, sp                 // Set up frame pointer

// Integer addition
add w4, w0, w1              // w4 = int1 + int2
str w4, [x2]                // Store result to *outInt

// Double addition
fadd d4, d0, d1             // d4 = double1 + double2
str d4, [x3]                // Store result to *outDouble

// Restore the link register and other caller-saved registers
ldp x29, x30, [sp], #16     // Load pair of registers from the stack (fp and lr)
ret                         // Return
