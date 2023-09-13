//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0 sdk_version 13, 3
.globl _customFunction ; -- Begin function customFunction
.p2align 2
_customFunction: ; @customFunction
.cfi_startproc

; x0 = int1, x1 = int2, d0 = double1, d1 = double2
; x2 = _outInt, x3 = _outDouble

str x30, [sp, #-16]! ; save link register

mov x8, x2 ; x8 = _outInt
str w0, [x8] ; store int1 to _outInt

mov x8, x3 ; x8 = _outDouble
str d0, [x8] ; store double1 to _outDouble

ldr x30, [sp], #16 ; restore link register
ret

.cfi_endproc
; -- End function
.subsections_via_symbols
