//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, -32]!  ; Allocate space for frame pointer, return address, and temporary registers.
mov x29, sp               ; Set the frame pointer.

; Move parameters to their respective places.
str x0, [x2]               ; Store int1 in outInt (*outInt = int1).
str d0, [x3]               ; Store double1 in outDouble (*outDouble = double1).

ldp x29, x30, [sp], 32    ; Restore frame pointer and return address.
ret                       ; Return.
