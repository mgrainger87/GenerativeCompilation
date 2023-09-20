//solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.section	__TEXT,__literal8,8byte_literals
.p2align	3
lCPI0_0:
.quad	0x3ffe666666666666              ; double 1.8999999999999999
.section	__TEXT,__text,regular,pure_instructions
.globl	_customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
mov	w8, #9                          ; Load the immediate value 9 into w8
mul	w8, w8, w0                      ; Multiply int1 by 9 using w8
str	w8, [x2]                       ; Directly store the result to *outInt

adrp	x8, lCPI0_0@PAGE
ldr	d1, [x8, lCPI0_0@PAGEOFF]
fmul	d0, d0, d1                     ; Multiply double1 by 1.9
str	d0, [x3]                       ; Directly store the result to *outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
