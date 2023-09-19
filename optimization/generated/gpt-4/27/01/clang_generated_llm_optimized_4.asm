//solution_number=4,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Load immediate floating-point values
fmov	d2, #1.00000000 ; Load 1.0 into d2
fmov	d3, #2.00000000 ; Load 2.0 into d3

; Start integer calculations
add	w8, w0, #2
add	w9, w1, #3
mul	w8, w8, w9

; Start floating-point calculations
fadd	d0, d0, d2
fadd	d1, d1, d3
fmul	d0, d0, d1

; Store results
str	w8, [x2]
str	d0, [x3]

ret
.cfi_endproc
