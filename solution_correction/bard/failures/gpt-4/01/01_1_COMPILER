; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp42wdgqb7.asm:9:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
.text
.p2align 4
_customFunction:
stp x29, x30, [sp, #-16]!   // Save frame pointer and return address
mov x29, sp                 // Set up frame pointer

str x0, [x2]                // *outInt = int1; Store int1 to the memory pointed by outInt
fstr d0, [x3]               // *outDouble = double1; Store double1 to the memory pointed by outDouble

ldp x29, x30, [sp], #16     // Restore frame pointer and return address
ret                         // Return
