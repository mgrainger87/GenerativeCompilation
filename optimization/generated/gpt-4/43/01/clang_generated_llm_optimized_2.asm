//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
stp    x30, xzr, [sp, #-16]!            ; Save only link register
fmov    d2, #10.00000000
fcmp    d0, d2
b.lt    LBB0_2                          ; Branch if less than

LBB0_1:
add    w8, w0, w1
str    w8, [x2]                        ; Store result to outInt
ldp    x30, xzr, [sp], #16             ; Restore link register and adjust stack pointer
ret

LBB0_2:
add    w1, w1, #1                      ; Increment int2
fmov    d2, #2.00000000
fadd    d0, d0, d2                     ; Increment double1
bl    _customFunction                 ; Recursive call
ldp    x30, xzr, [sp], #16             ; Restore link register and adjust stack pointer
ret

.cfi_endproc
; -- End function
.subsections_via_symbols
