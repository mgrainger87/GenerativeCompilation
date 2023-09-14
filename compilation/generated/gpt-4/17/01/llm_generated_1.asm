//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  3
_customFunction:
// Store link register and callee-saved registers
stp     lr, x29, [sp, #-16]!   // Save link register (lr) and frame pointer (x29) to stack
mov     x29, sp               // Set the frame pointer

// Compare int2 (w1) with 0
cmp     w1, #0

// If int2 < 0, *outInt = int1; else *outInt = int2;
csel    w4, w0, w1, lt         // Select w0 (int1) if less than, else select w1 (int2). Store result in w4
str     w4, [x2]              // Store the result to *outInt

// Compare double1 (d0) with double2 (d1)
fcmp    d0, d1

// If double1 > double2, *outDouble = double1; else *outDouble = double2;
fcsel   d3, d0, d1, gt         // Select d0 (double1) if greater than, else select d1 (double2). Store result in d3
str     d3, [x3]               // Store the result to *outDouble

// Restore link register and callee-saved registers
ldp     lr, x29, [sp], #16    // Restore link register (lr) and frame pointer (x29) from stack
ret
