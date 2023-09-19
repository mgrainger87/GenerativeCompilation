//solution_number=3,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
stp    x29, x30, [sp, #-16]!       ; Save frame and link registers and adjust stack pointer
.cfi_def_cfa_offset 16
add    x29, sp, #0                 ; Update frame pointer
.cfi_def_cfa w29, 0
.cfi_offset w30, -8
.cfi_offset w29, -16

cmp    w0, #0                      ; Compare int1 with 0
ble    LBB0_1                      ; Branch if less than or equal

subs    w0, w0, #2                 ; int1 -= 2
fmov    d2, #1.00000000            ; Load 1.0 to d2
fadd    d0, d0, d2                 ; double1 += 1.0
bl    _customFunction              ; Recursive call

LBB0_1:
str    d1, [x3]                    ; *outDouble = double2

LBB0_3:
ldp    x29, x30, [sp], #16         ; Restore frame and link registers and restore stack pointer
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
