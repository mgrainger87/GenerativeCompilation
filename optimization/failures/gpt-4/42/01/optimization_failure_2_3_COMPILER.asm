; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=2
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf_lkwqkb.asm:17:15: error: unexpected floating point literal
; fadd d0, d0, #1.0 ; Increment double1 by 1
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                  ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
stp    x29, x30, [sp, #-16]!              ; Store frame pointer and return address onto stack
.cfi_def_cfa_offset 16
.cfi_offset w30, -8
.cfi_offset w29, -16
add    x29, sp, #0
.cfi_def_cfa w29, 0

loop_start:
subs    w0, w0, #2                        ; Decrement int1 by 2
fadd    d0, d0, #1.0                      ; Increment double1 by 1
bgt     loop_start                        ; If w0 is greater than 0, loop

exit_loop:
str    d1, [x3]                           ; Store the value of double2 (from d1) at outDouble
ldp    x29, x30, [sp], #16                ; Restore frame pointer and return address, adjust stack pointer
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
