//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
sub	sp, sp, #16           ; Create stack space
stp	x29, x30, [sp]        ; Save frame pointer and return address
add	x29, sp, #16          ; Update frame pointer
str	w0, [x2]              ; Store int1 to *outInt
str	d0, [x3]              ; Store double1 to *outDouble
ldp	x29, x30, [sp]        ; Restore frame pointer and return address
add	sp, sp, #16           ; Reset stack pointer
ret                       ; Return to caller
.cfi_endproc
.subsections_via_symbols
