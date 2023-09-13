//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc
stp x29, x30, [sp, #-16]!     ; Store FP and LR on the stack (allocate 16 bytes)
add x29, sp, #0               ; Set FP to current stack pointer
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

str w0, [x2]                  ; Store int1 at the address pointed by outInt (x2)
str d0, [x3]                  ; Store double1 at the address pointed by outDouble (x3)

ldp x29, x30, [sp], #16       ; Restore FP and LR from the stack (deallocate 16 bytes)
ret
.cfi_endproc
