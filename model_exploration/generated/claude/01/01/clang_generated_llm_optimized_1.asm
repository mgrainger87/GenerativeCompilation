//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0 sdk_version 13, 3
.globl _customFunction ; -- Begin function customFunction
.p2align 2
_customFunction: ; @customFunction
.cfi_startproc

; x0 = int1, x1 = int2, x2 = outInt, x3 = outDouble
; d0 = double1, d1 = double2

str x30, [sp, #-16]! ; push return address
stp x29, x30, [sp, #-16]! ; push frame pointer and link register
mov x29, sp ; set frame pointer

str w0, [x2] ; store int1 to outInt
str d0, [x3] ; store double1 to outDouble

ldp x29, x30, [sp], #16 ; pop frame pointer and link register
ldr x30, [sp], #16 ; pop return address
ret

.cfi_endproc
; -- End function

.subsections_via_symbols
