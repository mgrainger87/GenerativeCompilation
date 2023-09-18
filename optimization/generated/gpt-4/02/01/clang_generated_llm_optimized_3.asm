//solution_number=3,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Store the double result (0.0) to the address in x3 (outDouble) directly using xzr
str	xzr, [x3]

; Store the integer result (0) to the address in x2 (outInt) directly using wzr
str	wzr, [x2]

ret
.cfi_endproc
