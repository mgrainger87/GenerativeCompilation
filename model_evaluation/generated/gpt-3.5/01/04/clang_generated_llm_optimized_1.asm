//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; Allocate stack space for local variables and save registers
sub	sp, sp, #48
.cfi_def_cfa_offset 48

; Store input parameters and pointers to output variables
str	w0, [sp, #44]          ; Save int1 on the stack
str	w1, [sp, #40]          ; Save int2 on the stack
str	d0, [sp, #32]          ; Save double1 on the stack
str	d1, [sp, #24]          ; Save double2 on the stack
str	x2, [sp, #16]          ; Save outInt pointer on the stack
str	x3, [sp, #8]           ; Save outDouble pointer on the stack

; Copy int1 to outInt
ldr	w8, [sp, #44]          ; Load int1 from the stack
ldr	x9, [sp, #16]          ; Load outInt pointer
str	w8, [x9]               ; Store int1 in outInt

; Copy double1 to outDouble
ldr	d0, [sp, #32]          ; Load double1 from the stack
ldr	x8, [sp, #8]           ; Load outDouble pointer
str	d0, [x8]               ; Store double1 in outDouble

; Deallocate stack space and return
add	sp, sp, #48
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
