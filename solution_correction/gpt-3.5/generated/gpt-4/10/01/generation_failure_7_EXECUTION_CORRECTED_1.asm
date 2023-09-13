//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.align	2
.global	_customFunction
.p2align	2
_customFunction:
stp	x29, x30, [sp, -16]!   ; Save frame pointer and link register to the stack.
add	x29, sp, 0            ; Set up frame pointer for the current stack frame.

str	w0, [x2]              ; Store int1 to the location pointed by outInt.
str	d0, [x3]             ; Store double1 to the location pointed by outDouble.

ldp	x29, x30, [sp], 16    ; Restore frame pointer and link register from the stack.
ret                      ; Return from the function.
