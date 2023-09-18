//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Store the integer result (0) to the address in x2 (outInt)
mov	w8, #0
str	w8, [x2]

; Store the double result (0.0) to the address in x3 (outDouble)
movi	d8, #0000000000000000
str	d8, [x3]

ret
.cfi_endproc
