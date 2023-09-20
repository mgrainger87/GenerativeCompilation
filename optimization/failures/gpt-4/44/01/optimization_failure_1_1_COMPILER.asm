; solution_number=1,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpq4v05fsq.asm:29:1: error: assembler local symbol 'LBB0_0' not defined
; 
; ^
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
; Compare if int1 (w0) is less than 10
subs	w8, w0, #10
cset	w8, lt
tbnz	w8, #0, LBB0_1
; Loop back to check again
b	LBB0_0
LBB0_1:
; If int1 is less than 10, double int2 and store in outInt
lsl	w8, w1, #1
str	w8, [x2]
b	LBB0_3
LBB0_2:
; Modify parameters for the next iteration
subs	w0, w0, #10
add	w1, w0, w1
b	LBB0_0
LBB0_3:
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
