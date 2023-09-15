//compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.globl  _helperFunction
.align  2                        ; Ensure 4-byte alignment
_helperFunction:                     ; mangled function name
add w0, w0, w1                   ; w0 = w0 + w1
ret                              ; return

.globl  _customFunction
.align  2                        ; Ensure 4-byte alignment
_customFunction:
stp x29, x30, [sp, #-16]!        ; save frame pointer and link register (callee-saved)
mov x29, sp                      ; set frame pointer

bl _helperFunction               ; call helperFunction
str w0, [x2]                     ; store result in *outInt

fadd d0, d0, d1                  ; d0 = d0 + d1
str d0, [x3]                     ; store result in *outDouble

ldp x29, x30, [sp], #16          ; restore frame pointer and link register
ret                              ; return
