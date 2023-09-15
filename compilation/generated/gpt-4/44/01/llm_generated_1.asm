//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
mov w8, w0           ; move 'a' from w0 to w8 for multiplication
mul w0, w8, w0       ; w0 = w8 * w0
ret                  ; return with result in w0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]! ; save frame pointer and link register
mov x29, sp            ; set new frame pointer

; Call helperFunction(int1)
bl _helperFunction     ; result will be in w0
str w0, [x2]           ; store the result in *outInt

; Compute double1 - double2
fsub d0, d0, d1        ; v0 = v0 - v1
str d0, [x3]           ; store the result in *outDouble

ldp x29, x30, [sp], #16; restore frame pointer and link register
ret
