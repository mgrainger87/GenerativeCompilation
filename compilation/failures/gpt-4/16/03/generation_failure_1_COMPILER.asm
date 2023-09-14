; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb33_o7rp.asm:15:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb33_o7rp.asm:25:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d2, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Store the link register
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Check if int1 (w0) is even
and     w4, w0, #1   // w4 gets the least significant bit of int1

// If w4 is 0, int1 is even
cbz     w4, even_branch

// Odd branch
str     w0, [x2]     // Store int1 in *outInt
fstr    d0, [x3]     // Store double1 in *outDouble
b       end

even_branch:
// int1 is even
lsr     w5, w0, #1   // Halve int1
str     w5, [x2]     // Store the result in *outInt

fmov    d2, #2.0     // Load 2.0 into floating-point register d2
fmul    d2, d0, d2   // Multiply double1 by 2.0
fstr    d2, [x3]     // Store the result in *outDouble

end:
// Restore the link register
ldp     x30, x29, [sp], #16
ret
