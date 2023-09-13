//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0 sdk_version 13, 3
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc
stp x29, x30, [sp, #-16]!      ; Store frame pointer and link register
add x29, sp, #0                ; Set frame pointer to current stack pointer
.cfi_def_cfa w29, 16
.cfi_offset w29, -16
.cfi_offset w30, -8

str w0, [x2]                   ; Store int1 at the address pointed by outInt
str d0, [x3]                   ; Store double1 at the address pointed by outDouble

ldp x29, x30, [sp], #16        ; Restore frame pointer and link register
ret                            ; Return
.cfi_endproc
