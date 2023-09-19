//solution_number=3,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Load the value 7 into w9
mov	w9, #7

; Compute (int1 * 7) and store the result to *outInt
mul	w9, w0, w9
str	w9, [x2]

; Load the floating point value 7.0 into d1
fmov	d1, #7.00000000

; Compute (double1 * 7) and store the result to *outDouble
fmul	d0, d0, d1
str	d0, [x3]

ret
.cfi_endproc
