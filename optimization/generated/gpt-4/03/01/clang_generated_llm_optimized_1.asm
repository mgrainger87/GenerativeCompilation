//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
stp    x29, x30, [sp, #-16]!             ; Save frame pointer and link register
mov    x29, sp                           ; Set the frame pointer
str    w0, [x2]                          ; Store int1 to *outInt
fmov   d0, #1.0                          ; Load 1.0 into d0
str    d0, [x3]                          ; Store 1.0 to *outDouble
ldp    x29, x30, [sp], #16               ; Restore frame pointer and link register
ret
.cfi_endproc
