//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; tmp3 = int1 + int2
add	w8, w0, w1

; *outInt = tmp3
str	w8, [x2]

; *outDouble = double1 + double2
fadd	d0, d0, d1
str	d0, [x3]

ret
.cfi_endproc
.subsections_via_symbols
