//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!     ; Save frame and link register to stack
mov x29, sp                  ; Set up frame pointer

str x0, [x2]                 ; Store value of int1 (x0) to address pointed by outInt (x2)
str d1, [x3]                 ; Store value of double2 (d1) to address pointed by outDouble (x3)

ldp x29, x30, [sp], #16      ; Restore frame and link register from stack
ret                         ; Return to caller
