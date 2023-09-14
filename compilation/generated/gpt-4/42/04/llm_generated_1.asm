//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _helperFunction
_helperFunction:
fmul d0, d0, d1        ; multiply a and b
ret                    ; return the result in d0
.globl _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; store frame pointer and link register
mov x29, sp               ; set frame pointer

bl _helperFunction        ; call helperFunction with d0 and d1 as parameters
str d0, [x3]              ; store the result in *outDouble

sub w0, w0, w1            ; subtract int2 from int1
str w0, [x2]              ; store the result in *outInt

ldp x29, x30, [sp], #16   ; restore frame pointer and link register
ret
