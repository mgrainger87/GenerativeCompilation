//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.section	__TEXT,__literal8,8byte_literals
.p2align	3                               ; -- Begin function customFunction
lCPI0_0:
.quad	0x3ffb333333333333              ; double 1.7
.section	__TEXT,__text,regular,pure_instructions
.globl	_customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
adrp	x8, lCPI0_0@PAGE
ldr	d1, [x8, lCPI0_0@PAGEOFF]       ; load constant 1.7 into d1
fmul	d0, d0, d1                      ; d0 = double1 * 1.7
str	d0, [x3]                       ; store the result to outDouble
add	w0, w0, #12                    ; w0 = int1 + 12
str	w0, [x2]                       ; store the result to outInt
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
