//solution_number=5,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
add     w0, w0, w1, UXTW  ; w0 = int1 + int2 (with int2 as an extended register with no actual extension)
sub     w0, w0, #6        ; w0 = w0 - 6
str     w0, [x2]          ; store the result at the location pointed to by outInt
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
