//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.p2align 2
.globl _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!   ; Save the frame pointer and the link register.
mov x29, sp                ; Set up the new frame pointer.
str w0, [x2]               ; Store int1 into *outInt.
str d0, [x3]               ; Store double1 into *outDouble.
ldp x29, x30, [sp], #16    ; Restore the frame pointer and the link register.
ret                        ; Return.
