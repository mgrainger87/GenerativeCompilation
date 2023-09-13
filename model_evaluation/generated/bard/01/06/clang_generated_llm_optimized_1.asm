//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #48
.cfi_def_cfa_offset 48
str	w0, [sp, #44] ; int1
str	w1, [sp, #40] ; int2
str	d0, [sp, #32] ; double1
str	d1, [sp, #24] ; double2
str	x2, [sp, #16] ; outInt
str	x3, [sp, #8] ; outDouble
ldr	w8, [sp, #44] ; int1
ldr	x9, [sp, #16] ; outInt
str	w8, [x9]
ldr	d0, [sp, #32] ; double1
ldr	x8, [sp, #8] ; outDouble
str	d0, [x8]
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
