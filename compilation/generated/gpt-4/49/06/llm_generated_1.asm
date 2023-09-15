//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fadd    d0, d0, d1          ; Add the two floating point numbers
ret                         ; Return with the result in d0
.global _customFunction
_customFunction:
stp     x29, x30, [sp, #-16]!    ; Save frame pointer and link register
mov     x29, sp                  ; Set up frame pointer for this function

add     w4, w0, w1               ; Add int1 and int2
str     w4, [x2]                 ; Store the result to *outInt

bl      _helperFunction          ; Call helperFunction
str     d0, [x3]                 ; Store the result to *outDouble

ldp     x29, x30, [sp], #16      ; Restore frame pointer and link register
ret                             ; Return
