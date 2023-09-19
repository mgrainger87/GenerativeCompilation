//solution_number=3,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute int2 * 4 and store it in *outInt
lsl	w1, w1, #2
str	w1, [x2]

; Load the constant 0.75 into d2 and multiply double2 with it, then store the result in *outDouble
fmov	d2, #0.75000000
fmul	d1, d1, d2
str	d1, [x3]

ret
.cfi_endproc
