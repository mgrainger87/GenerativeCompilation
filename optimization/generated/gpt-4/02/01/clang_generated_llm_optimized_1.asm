//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; int1 * 0 is always 0
mov	w8, #0
str	w8, [x2]                      ; Store 0 to the location pointed by outInt

; double1 * 0.0 is always 0.0
movi	d8, #0000000000000000
str	d8, [x3]                      ; Store 0.0 to the location pointed by outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
