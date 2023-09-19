//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; int a = int1 * 2;
add	w8, w0, w0

; *outInt = a;
str	w8, [x2]

; double x = double1 * 0.5;
fmov	d1, #0.50000000
fmul	d0, d0, d1

; *outDouble = x;
str	d0, [x3]

ret
.cfi_endproc
