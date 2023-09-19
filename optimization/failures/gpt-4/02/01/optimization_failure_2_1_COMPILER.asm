; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9lzicfor.asm:12:5: error: invalid operand for instruction
; str dzr, [x3] ; Store 0.0 to the location pointed by outDouble using the zero register
;     ^
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
; int1 * 0 is always 0
str	wzr, [x2]                      ; Store 0 to the location pointed by outInt using the zero register

; double1 * 0.0 is always 0.0
str	dzr, [x3]                      ; Store 0.0 to the location pointed by outDouble using the zero register

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
