; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmppu07kebj.asm:6:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
.align 3
_customFunction:
// Store the parameters into their respective destination
str w0, [x2]     // *outInt = int1
fstr d0, [x3]   // *outDouble = double1

// Return
ret
