//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute int1 * int1 and store the result in w8
mul	w8, w0, w0

; Compute w8 * w8 and store the result in w8
mul	w8, w8, w8

; Store the result at the address pointed to by outInt
str	w8, [x2]

; Compute double1 * double1 and store the result in d1
fmul	d1, d0, d0

; Compute d1 * d1 and store the result in d0
fmul	d0, d1, d1

; Store the result at the address pointed to by outDouble
str	d0, [x3]

ret
.cfi_endproc
