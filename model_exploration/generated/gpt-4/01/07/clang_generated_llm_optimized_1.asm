//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; Directly store the int1 value to the memory location pointed to by outInt
str	w0, [x2]
; Directly store the double1 value to the memory location pointed to by outDouble
str	d0, [x3]
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
