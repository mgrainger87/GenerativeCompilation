; compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: ld: 64-bit LDR/STR not 8-byte aligned: from _customFunction (0x10000392C) to _outDouble (0x100008004) in '_customFunction' from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzb08ji5o.o for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

// Save callee-saved registers
stp	x29, x30, [sp, #-16]!

// Set up a stack frame
add	x29, sp, #0

// Store input parameters
str	w0, [x29, #-4]
str	w1, [x29, #-8]
str	d0, [x29, #-16]
str	d1, [x29, #-32]

// Load addresses of output variables
adrp	x8, _outInt@PAGE
ldr	x8, [x8, _outInt@PAGEOFF]
adrp	x9, _outDouble@PAGE
ldr	x9, [x9, _outDouble@PAGEOFF]

// Load input values
ldr	w0, [x29, #-4]
ldr	d1, [x29, #-16]

// Store input values into output variables
str	w0, [x8]
str	d1, [x9]

// Restore callee-saved registers and return
ldp	x29, x30, [sp], #16
ret

.cfi_endproc

.section	__DATA,__data
.align	3
_outInt:
.space	4
_outDouble:
.space	8
