//solution_number=4,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; For *outInt = (int1 * 6) * 0.5;
add	w0, w0, w0, LSL #1	; w0 = w0 + (w0 << 1) which is effectively multiplying by 3
str	w0, [x2]	; Store the result to *outInt

; For *outDouble = (double1 * 8) * 0.25;
fmov	d1, #2.00000000	; Load 2 into d1
fmul	d0, d0, d1	; Multiply double1 by 2 directly in d0
str	d0, [x3]	; Store the result to *outDouble

ret
.cfi_endproc
