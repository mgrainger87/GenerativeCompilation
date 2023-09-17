//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #16                     ; Reserve space for local stack frame
.cfi_def_cfa_offset 16

; The condition "int1 > int2 && int1 < int2" will never be true.
; Therefore, no need for condition checks and subtraction related to the ints.

; Sum up the doubles and store the result at the location pointed to by x3 (outDouble)
fadd	d0, d0, d1
str	d0, [x3]

add	sp, sp, #16                     ; Restore stack pointer
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
