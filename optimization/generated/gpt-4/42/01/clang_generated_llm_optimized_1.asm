//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub    sp, sp, #64                 ; Adjust stack pointer
.cfi_def_cfa_offset 64
stp    x29, x30, [sp, #48]         ; Save frame and link registers
add    x29, sp, #48                ; Update frame pointer
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
str    d1, [sp, #24]               ; Store double2 for later use
str    x3, [sp, #8]                ; Store outDouble for later use

subs    w8, w0, #0                 ; Check if int1 <= 0
cset    w8, le
tbnz    w8, #0, LBB0_1

LBB0_2:
subs    w0, w0, #2                 ; int1 -= 2
fmov    d2, #1.00000000            ; Load 1.0 to d2
fadd    d0, d0, d2                 ; double1 += 1.0
bl    _customFunction              ; Recursive call
b    LBB0_3

LBB0_1:
ldr    d1, [sp, #24]               ; Load double2
ldr    x8, [sp, #8]                ; Load outDouble
str    d1, [x8]                    ; *outDouble = double2

LBB0_3:
ldp    x29, x30, [sp, #48]         ; Restore frame and link registers
add    sp, sp, #64                 ; Restore stack pointer
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
