//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction
.p2align    2
_customFunction:
.cfi_startproc
; Check if int1 > 5
subs    w8, w0, #5
b.le    1f  ; If int1 <= 5, go to label 1

; If int1 > 5
str    w0, [x2]     ; Store int1 to *outInt
ret

1:  ; Else
add    w8, w0, w1  ; w8 = int1 + int2
str    w8, [x2]     ; Store w8 to *outInt

fsub    d0, d0, d1  ; d0 = double1 - double2
str    d0, [x3]     ; Store d0 to *outDouble
ret

.cfi_endproc
