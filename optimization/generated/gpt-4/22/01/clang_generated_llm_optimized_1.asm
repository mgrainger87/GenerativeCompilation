//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Optimize integer multiplication by 5
lsl w8, w0, #2  ; w8 = int1 * 4
add w8, w8, w0  ; w8 = int1 * 5
str w8, [x2]    ; store result to outInt

; Optimize double multiplication by 6
fadd d8, d0, d0 ; d8 = double1 * 2
fadd d9, d8, d8 ; d9 = double1 * 4
fadd d0, d8, d9 ; d0 = double1 * 6
str d0, [x3]    ; store result to outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
