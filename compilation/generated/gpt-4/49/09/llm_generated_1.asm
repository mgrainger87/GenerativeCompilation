//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fadd d0, d0, d1   ; d0 = a + b
ret
.global _customFunction
_customFunction:
; Save link register and callee-saved registers if needed
stp x30, x29, [sp, #-16]!
mov x29, sp

; *outInt = int1 + int2;
add w4, w0, w1    ; w4 = int1 + int2
str w4, [x2]      ; Store the result to *outInt

; *outDouble = helperFunction(double1, double2);
bl _helperFunction ; Call helperFunction
str d0, [x3]      ; Store the result to *outDouble

; Restore link register and return
ldp x30, x29, [sp], #16
ret
