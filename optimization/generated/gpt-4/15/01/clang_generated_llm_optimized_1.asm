//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #48                 ; Allocate stack space
.cfi_def_cfa_offset 48
str	x30, [sp, #40]              ; Save the link register
str	x2, [sp, #32]               ; Save x2
str	x3, [sp, #24]               ; Save x3

fadd	d0, d0, d1                 ; d0 = double1 + double2
str	d0, [x3]                   ; Store the result in outDouble

ldr	x3, [sp, #24]               ; Restore x3
ldr	x2, [sp, #32]               ; Restore x2
ldr	x30, [sp, #40]              ; Restore the link register
add	sp, sp, #48                 ; Deallocate stack space
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
