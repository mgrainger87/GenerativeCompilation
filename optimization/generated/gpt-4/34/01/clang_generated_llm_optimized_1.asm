//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Calculate int1 * 3
mov	w8, #3
mul	w8, w0, w8

; Store result in *outInt
str	w8, [x2]

; Load 0.25 into d2 and calculate double2 * 0.25
fmov	d2, #0.25000000
fmul	d0, d1, d2

; Store result in *outDouble
str	d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
