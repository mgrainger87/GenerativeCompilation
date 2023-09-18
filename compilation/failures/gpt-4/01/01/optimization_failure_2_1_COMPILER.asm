; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpi44tliq8.asm:10:5: error: invalid operand for instruction
; add [w2], w0, w1 ; Add int2 to *outInt
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpi44tliq8.asm:14:6: error: invalid operand for instruction
; fadd [x3], d0, d1 ; Add double2 to *outDouble
;      ^
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

; Add the integer parameters and store the result directly
str	w0, [x2]         ; Store int1 to *outInt
add	[w2], w0, w1     ; Add int2 to *outInt

; Add the double parameters and store the result directly
str	d0, [x3]         ; Store double1 to *outDouble
fadd	[x3], d0, d1     ; Add double2 to *outDouble

; Return
ret
.cfi_endproc
.subsections_via_symbols
