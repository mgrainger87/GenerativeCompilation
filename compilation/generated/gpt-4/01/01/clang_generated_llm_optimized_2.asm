//solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Add the integer parameters and store the result
add	w8, w0, w1
str	w8, [x2]

; Add the double parameters and store the result
fadd	d2, d0, d1
str	d2, [x3]

; Return
ret
.cfi_endproc
.subsections_via_symbols
