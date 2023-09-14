; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp3e48vasg.asm:9:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp3e48vasg.asm:18:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d4, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Check if int1 is even
and     w4, w0, #1          // w4 = int1 % 2
cbz     w4, .Lis_even      // If w4 == 0 (int1 is even), branch to .Lis_even

// Odd path
str     w0, [x2]           // *outInt = int1
fstr    d0, [x3]           // *outDouble = double1
ret

.Lis_even:
// Even path
lsr     w4, w0, #1         // w4 = int1 / 2
str     w4, [x2]           // *outInt = int1 / 2
fmov    d4, #2.0           // Load 2.0 into d4
fmul    d4, d0, d4         // d4 = double1 * 2.0
fstr    d4, [x3]           // *outDouble = double1 * 2.0
ret
