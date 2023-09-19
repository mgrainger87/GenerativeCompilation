//solution_number=2,compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction
.p2align    4
_customFunction:                        ; @customFunction
.cfi_startproc

; For *outInt = (int1 * 7) + int1;
lsl    w8, w0, #3                   ; Logical shift left of int1 (w0) by 3 bits. This multiplies int1 by 8.
str    w8, [x2]                     ; Store the result to *outInt

; For *outDouble = (double1 * 15) + double1;
fmov   d1, #16.0                    ; Load the value 16.0 into d1
fmul   d0, d0, d1                   ; Multiply double1 (d0) by 16.0, result in d0. This multiplies double1 by 16.
str    d0, [x3]                     ; Store the result to *outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
