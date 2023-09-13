; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp_5tubh03.asm:17:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
// Making the function symbol global

.align 3
// Aligning the symbol as per arm64 convention

_customFunction:
stp x19, x20, [sp, #-16]!
// Push x19 and x20 to the stack for preserving them

nop
// No operation (can be omitted)

str x0, [x2]
// Store int1 into *outInt

fstr d0, [x3]
// Store double1 into *outDouble

ldp x19, x20, [sp], #16
// Pop x19 and x20 from the stack, restoring their values

ret
// Return from the function
