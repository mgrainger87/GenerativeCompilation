//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; Save frame pointer and link register
mov x29, sp               ; Set up frame pointer

; Compute int1 + int2 * 2
lsl w4, w1, 1             ; w4 = int2 * 2
add w4, w4, w0            ; w4 = int1 + w4
str w4, [x2]              ; Store result to *outInt

; Compute double1 * 2 + double2
fadd d4, d0, d0           ; d4 = double1 * 2
fadd d4, d4, d1           ; d4 = d4 + double2
str d4, [x3]              ; Store result to *outDouble

ldp x29, x30, [sp], #16   ; Restore frame pointer and link register
ret
