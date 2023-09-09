//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=2
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Adding constants to the input registers
add	w0, w0, #5   ; int1 + 5
add	w1, w1, #3   ; int2 + 3

; Multiplying the two results
mul	w0, w0, w1

; Storing the result in the location pointed by outInt
str	w0, [x2]

ret
.cfi_endproc
.subsections_via_symbols
