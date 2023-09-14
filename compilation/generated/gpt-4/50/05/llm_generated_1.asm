//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
add x0, x0, #10     ; x0 = a + 10
ret                 ; return x0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; save frame pointer and link register
mov x29, sp                ; update frame pointer

; Call helperFunction(int1)
bl _helperFunction         ; Call helperFunction. x0 now contains the result.

; Store the result of helperFunction into *outInt
str w0, [x2]               ; w0 (lower 32 bits of x0) contains result of helperFunction, store it in *outInt

; Store double2 into *outDouble
str d1, [x3]               ; d1 contains double2, store it in *outDouble

ldp x29, x30, [sp], #16   ; restore frame pointer and link register
ret                       ; return
