//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.align	2
.globl	_customFunction
.p2align	2
_customFunction:
stp	x29, x30, [sp, -16]!  ; Save frame pointer and return address
mov	x29, sp              ; Set up frame pointer

str	w0, [x2]             ; Store int1 into *outInt
str	d0, [x3]             ; Store double1 into *outDouble

ldp	x29, x30, [sp], 16  ; Restore frame pointer and return address
ret                     ; Return
