//solution_number=4,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction
.p2align    2
_customFunction:
.cfi_startproc
; Check if int1 > 5
subs    wzr, w0, #5  ; Use zero register for discard

; If int1 > 5, result = int1, otherwise result = int1 + int2
add    w1, w0, w1  ; w1 = int1 + int2
csel   w1, w0, w1, gt ; If greater, select w0, otherwise w1
str    w1, [x2]     ; Store result to *outInt

; Compute double1 - double2 and store
fsub    d0, d0, d1  ; d0 = double1 - double2
str    d0, [x3]     ; Store d0 to *outDouble

ret
.cfi_endproc
