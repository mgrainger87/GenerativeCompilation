//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fmul d0, d0, d0  ; d0 = a * a
ret
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; Store frame pointer and link register
mov x29, sp                ; Set frame pointer

; Assign int1 to *outInt
str w0, [x2]

; Call helperFunction(double1)
bl _helperFunction         ; d0 now has the result

; Assign result to *outDouble
str d0, [x3]

ldp x29, x30, [sp], #16   ; Restore frame pointer and link register
ret
