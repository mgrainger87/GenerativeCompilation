//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc

; For *outInt = (int1 * 7) + int1;
mov    w8, #8                        ; Load the value 8 into w8
mul    w8, w0, w8                    ; Multiply int1 (w0) by 8, result in w8. This effectively calculates (int1 * 8)
str    w8, [x2]                     ; Store the result to *outInt

; For *outDouble = (double1 * 15) + double1;
fmov   d1, #16.0                    ; Load the value 16.0 into d1
fmul   d0, d0, d1                   ; Multiply double1 (d0) by 16.0, result in d0. This effectively calculates (double1 * 16)
str    d0, [x3]                     ; Store the result to *outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
