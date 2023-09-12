; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:24:1: error: ADR/ADRP relocations must be GOT relative
; adrp x8, _outInt
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:24:1: error: unknown AArch64 fixup kind!
; adrp x8, _outInt
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:25:1: error: unknown AArch64 fixup kind!
; ldr x9, [x8, #:lo12:_outInt]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:26:1: error: ADR/ADRP relocations must be GOT relative
; adrp x10, _outDouble
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:26:1: error: unknown AArch64 fixup kind!
; adrp x10, _outDouble
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:27:1: error: unknown AArch64 fixup kind!
; ldr x11, [x10, #:lo12:_outDouble]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmptttmf8qn-5be022.s:27:1: error: fixup must be 8-byte aligned
; ldr x11, [x10, #:lo12:_outDouble]
; ^
; 
; ; Linker error: None
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
adrp	x8, _outInt
ldr	x9, [x8, #:lo12:_outInt]
adrp	x10, _outDouble
ldr	x11, [x10, #:lo12:_outDouble]

// Load input values
ldr	w0, [x29, #-4]
ldr	d1, [x29, #-16]

// Store input values into output variables
str	w0, [x9]
str	d1, [x11]

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
