//solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=2
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Calculate (int1 + 2) * (int2 + 3)
add	w8, w0, #2 ; w8 = 2
add	w9, w1, #3 ; w9 = 3
mul	w8, w8, w9 ; w8 = 6
str	w8, [x2] ; Store result to outInt

; Calculate (double1 + 1.0) * (double2 + 2.0)
fmov	d2, #1.00000000 ; d2 = 1.0
fadd	d0, d0, d2 ; d0 = 1.0
fmov	d2, #2.00000000 ; d2 = 2.0
fadd	d1, d1, d2 ; d1 = 2.0
fmul	d0, d0, d1 ; d0 = 2.0
str	d0, [x3] ; Store result to outDouble

ret
.cfi_endproc
