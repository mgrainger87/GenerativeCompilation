//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1   ; d0 = a / b
ret
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; save frame pointer and link register
mov x29, sp               ; set up frame pointer

; *outInt = int2;
str w1, [x2]

; *outDouble = helperFunction(double1, double2);
bl _helperFunction        ; call helperFunction
str d0, [x3]              ; store the result in *outDouble

ldp x29, x30, [sp], #16   ; restore frame pointer and link register
ret
