//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	w0, w0, w1           ; Subtract int1 and int2
str	w0, [x2]             ; Store result at address outInt

fsub	d0, d0, d1           ; Subtract double1 and double2
str	d0, [x3]             ; Store result at address outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
