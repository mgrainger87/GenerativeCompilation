; solution_number=3,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpeja4707c.asm:13:15: error: unexpected floating point literal
; fmul d1, d1, #0.75000000
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute int2 * 4 and store it in *outInt
lsl	w1, w1, #2
str	w1, [x2]

; Compute double2 * 0.75 and store it in *outDouble
fmul	d1, d1, #0.75000000
str	d1, [x3]

ret
.cfi_endproc
