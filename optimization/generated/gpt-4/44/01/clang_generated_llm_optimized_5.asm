//solution_number=5,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
mov w9, wzr                           ; w9 will hold the accumulated sum of int1 values
LBB0_0:                                 ; Start of the loop
; Compare if int1 (w0) is less than 10
cmp	w0, #10
blt	LBB0_1                          ; Branch directly if less than
; Update parameters for next iteration
add w9, w9, w0                       ; Add the current int1 to the accumulator
subs	w0, w0, #10                   ; Decrement int1 by 10
b	LBB0_0                        ; Loop back to the beginning without extra check
LBB0_1:
; Add the accumulated sum to int2
add w1, w1, w9
; If int1 is less than 10, double int2 and store in outInt
lsl	w8, w1, #1
str	w8, [x2]
LBB0_3:
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
