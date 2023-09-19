; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9ufx1hld.asm:14:15: error: unexpected floating point literal
; fmul d0, d0, #4.00000000
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:

; Calculate (int1 * 6) - (int1 * 2) = int1 * 4
lsl w0, w0, #2
str w0, [x2]                      ; Store result to outInt

; Calculate (double1 * 7) - (double1 * 3) = double1 * 4
fmul d0, d0, #4.00000000
str d0, [x3]                      ; Store result to outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
