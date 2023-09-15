//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
; Multiply int1 by itself and store result in *outInt
; x0: int1
; x2: outInt
mul w4, w0, w0        ; w4 = int1 * int1
str w4, [x2]          ; *outInt = w4

; Multiply double2 by itself and store result in *outDouble
; d1: double2
; x3: outDouble
fmul d2, d1, d1       ; d2 = double2 * double2
str d2, [x3]          ; *outDouble = d2

ret                   ; return
