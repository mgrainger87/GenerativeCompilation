; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmprplue9e1.asm:9:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3] ; Store double1 to the location pointed by outDouble
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .align	2
.global	_customFunction
.p2align	2
_customFunction:
stp	x29, x30, [sp, -16]!   ; Save frame pointer and link register
add	x29, sp, 0            ; Set up frame pointer

str	w0, [x2]              ; Store int1 to the location pointed by outInt
fstr	d0, [x3]             ; Store double1 to the location pointed by outDouble

ldp	x29, x30, [sp], 16    ; Restore frame pointer and link register
ret                      ; Return
