//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save FP (Frame Pointer) and LR (Link Register)
mov x29, sp               // Set FP to current SP (Stack Pointer)

// Compute *outInt = (int1 > 10) ? int1 * int2 : int1 + int2;
cmp w0, #10               // Compare int1 with 10
bls .1_else               // If less than or equal to 10, branch to else
mul w4, w0, w1            // int1 * int2, result in w4
b .1_end
.1_else:
add w4, w0, w1            // int1 + int2, result in w4
.1_end:
str w4, [x2]              // Store result in *outInt

// Compute *outDouble = (double2 < 5.0) ? double1 : double2;
fmov d2, #5.0             // Load 5.0 into floating-point register d2
fcmp d1, d2               // Compare double2 with 5.0
bge .2_else               // If greater than or equal to 5.0, branch to else
fmov d3, d0               // Move double1 to d3
b .2_end
.2_else:
fmov d3, d1               // Move double2 to d3
.2_end:
str d3, [x3]              // Store result in *outDouble

// Epilogue
ldp x29, x30, [sp], #16   // Restore FP and LR
ret                       // Return
