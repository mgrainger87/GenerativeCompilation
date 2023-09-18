//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Multiply integers and store directly
mul	w0, w0, w1
str	w0, [x2]

; Multiply doubles and store directly
fmul	d0, d0, d1
str	d0, [x3]

ret

.cfi_endproc
