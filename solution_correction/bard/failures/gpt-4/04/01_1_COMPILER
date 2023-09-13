; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4odo60o0.asm:14:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .build_version macos, 13, 0	sdk_version 13, 3

// Import external symbols
.extern printf

.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
// Store int1 to *outInt
str	w0, [x2]

// Store double1 to *outDouble
fstr	d0, [x3]

ret
.cfi_endproc

.globl	_printInt
.p2align	2
_printInt:
.cfi_startproc
// Stack setup for printf (assuming it's not variadic for simplicity)
sub	sp, sp, #16
stp	x29, x30, [sp, #8]
add	x29, sp, #8

// call printf
bl	printf

// Restore stack and return
ldp	x29, x30, [sp, #8]
add	sp, sp, #16
ret
.cfi_endproc

.subsections_via_symbols
