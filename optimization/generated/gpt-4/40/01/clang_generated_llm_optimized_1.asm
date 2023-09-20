//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
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
sub	sp, sp, #32                     ; Reduce stack space allocation
.cfi_def_cfa_offset 32

str	x2, [sp, #16]                   ; Save the pointer 'outInt' to the stack
str	x3, [sp, #24]                   ; Save the pointer 'outDouble' to the stack

mov	w8, #9
mul	w8, w0, w8                      ; Multiply int1 by 9
ldr	x9, [sp, #16]
str	w8, [x9]                       ; Directly store the result to *outInt

adrp	x8, lCPI0_0@PAGE
ldr	d1, [x8, lCPI0_0@PAGEOFF]
fmul	d0, d0, d1                     ; Multiply double1 by 1.9
ldr	x8, [sp, #24]
str	d0, [x8]                       ; Directly store the result to *outDouble

add	sp, sp, #32                     ; Restore the stack pointer
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
