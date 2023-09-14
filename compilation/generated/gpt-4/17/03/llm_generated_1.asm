//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!     ; Save frame pointer and link register
mov x29, sp                   ; Set frame pointer

cmp w1, #0                    ; Compare int2 with 0
csel w8, w0, w1, lt           ; Conditional select
str w8, [x2]                  ; Store result to *outInt

fcmp d0, d1                   ; Compare double1 with double2
fcsel d8, d0, d1, gt          ; Conditional select for floating point
str d8, [x3]                  ; Store result to *outDouble

ldp x29, x30, [sp], #16       ; Restore frame pointer and link register
ret                           ; Return
