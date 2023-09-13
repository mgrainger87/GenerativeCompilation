//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
stp	x29, x30, [sp, -16]!   ; Save frame pointer and link register
add	x29, sp, 0             ; Set up frame pointer

str	w0, [x2]               ; Store int1 into the location pointed by outInt
str	d0, [x3]               ; Store double1 into the location pointed by outDouble

ldp	x29, x30, [sp], 16     ; Restore frame pointer and link register
ret
.cfi_endproc
.subsections_via_symbols
