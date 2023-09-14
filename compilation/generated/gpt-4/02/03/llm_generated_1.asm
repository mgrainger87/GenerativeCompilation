//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2
_customFunction:
// Prologue
str     lr, [sp, #-16]!    // Save link register to stack

// Body of the function
sub     w4, w0, w1         // int1 - int2
str     w4, [x2]          // Store result to *outInt

fsub    d2, d0, d1        // double1 - double2
str     d2, [x3]          // Store result to *outDouble

// Epilogue
ldr     lr, [sp], #16     // Restore link register from stack
ret                        // Return
