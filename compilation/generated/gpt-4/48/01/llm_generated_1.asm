//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
sub w0, wzr, w0  ; Subtract w0 from zero to get its negation
ret              ; Return the value in w0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]! ; Save frame pointer and link register
mov x29, sp               ; Update frame pointer

bl _helperFunction        ; Call helperFunction with w1 (int2) as argument
; The result is returned in w0

str w0, [x2]             ; Store the result in memory pointed to by outInt

fmov d1, d0              ; Move the value of double1 into d1
str d1, [x3]             ; Store double1 in memory pointed to by outDouble

ldp x29, x30, [sp], #16  ; Restore frame pointer and link register
ret                      ; Return
