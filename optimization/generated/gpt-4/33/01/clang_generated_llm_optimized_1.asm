//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Calculate a = int1 - int2
sub	w8, w0, w1

; Store the result to *outInt
str	w8, [x2]

; Calculate x = double2 + double1
fadd	d0, d0, d1

; Store the result to *outDouble
str	d0, [x3]

ret
.cfi_endproc
