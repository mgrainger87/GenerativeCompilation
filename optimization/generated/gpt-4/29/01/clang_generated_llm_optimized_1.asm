//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute (int1 * 7) and store the result to *outInt
mov	w9, #7
mul	w8, w0, w9
str	w8, [x2]

; Compute (double1 * 7) and store the result to *outDouble
fmov	d1, #7.00000000
fmul	d0, d0, d1
str	d0, [x3]

ret
.cfi_endproc
