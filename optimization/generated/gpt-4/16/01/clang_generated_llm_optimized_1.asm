//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; tmp1 = int1 * 2
lsl	w8, w0, #1

; tmp2 = int2 - 5
subs	w9, w1, #5

; tmp3 = int1 + int2
add	w10, w0, w1

; *outInt = tmp3
str	w10, [x2]

; tmpDouble1 = double1 / 2
fmov	d2, #2.00000000
fdiv	d2, d0, d2

; tmpDouble2 = double2 * 3
fmov	d3, #3.00000000
fmul	d3, d1, d3

; *outDouble = double1 + double2
fadd	d0, d0, d1
str	d0, [x3]

ret
.cfi_endproc
.subsections_via_symbols
