; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp64wzk0og.asm:27:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp64wzk0og.asm:32:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save link register and callee-saved registers (if any are used)
stp x30, xzr, [sp, #-16]!   // Save LR (x30) and space for an unused register (xzr) to maintain 16-byte alignment

// *outInt = (int1 > 10) ? int1 * int2 : int1 + int2;
cmp w0, #10      // Compare int1 (x0) with 10
bls .L1          // If int1 <= 10, branch to label .L1

// int1 * int2
mul w4, w0, w1   // Multiply int1 and int2 and store the result in w4
str w4, [x2]     // Store the result to *outInt
b .L2            // Jump to label .L2

.L1:
// int1 + int2
add w4, w0, w1   // Add int1 and int2 and store the result in w4
str w4, [x2]     // Store the result to *outInt

.L2:
// *outDouble = (double2 < 5.0) ? double1 : double2;
fmov d4, #5.0    // Load 5.0 into d4
fcmp d1, d4      // Compare double2 (d1) with 5.0
bge .L3          // If double2 >= 5.0, branch to label .L3

// double1
fstr d0, [x3]    // Store double1 to *outDouble
b .L4            // Jump to label .L4

.L3:
// double2
fstr d1, [x3]     // Store double2 to *outDouble

.L4:
// Restore link register and callee-saved registers (if any are used)
ldp x30, xzr, [sp], #16   // Restore LR (x30) and space for an unused register (xzr) while also adjusting the stack pointer
ret                     // Return to caller
