; compiler_errors=4,linker_errors=3,execution_errors=3,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
;   "printf", referenced from:
;       _printInt in tmp5cc32df6.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #16
stp	x29, x30, [sp, #8]
add	x29, sp, #8
mov	w8, w0
mov	w9, w1
fmov	d0, d2
fmov	d1, d3
ldr	x10, [sp, #24]
cmp	x10, #99
b	.LBB0_3
.LBB0_2:
mov	x11, #0
.LBB0_3:
ldr	x2, [x29, #24]
add	x2, x2, x11
ldr	w0, [x2]
bl	_printInt
ldp	x29, x30, [sp, #8]
add	sp, sp, #16
ret
.cfi_endproc
; -- End function

.globl	_printInt
.p2align	2
_printInt:                        ; @printInt
.cfi_startproc
; %bb.0:
sub	sp, sp, #16
stp	x29, x30, [sp, #8]
add	x29, sp, #8
mov	w0, w1
bl	printf
ldp	x29, x30, [sp, #8]
add	sp, sp, #16
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
