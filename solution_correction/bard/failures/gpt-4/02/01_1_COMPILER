; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpmj47sm82.asm:11:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
.align 3

_customFunction:
// Store the values of int1 and double1 to *outInt and *outDouble respectively.

// Store int1 (x0) into *outInt (x2)
str w0, [x2]      // "w" since int is 32-bits on LP64

// Store double1 (d0) into *outDouble (x3)
fstr d0, [x3]     // store floating-point value

// Return from function
ret
