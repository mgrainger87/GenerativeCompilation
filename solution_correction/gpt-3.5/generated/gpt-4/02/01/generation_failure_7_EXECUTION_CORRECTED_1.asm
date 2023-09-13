//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x19, x20, [sp, -16]!     ; Saving x19 and x20 to stack
stp x21, x30, [sp, -16]!     ; Saving x21 and link register x30 to stack

str w0, [x2]                 ; Storing int1 to outInt
str d0, [x3]                 ; Storing double1 to outDouble

ldp x21, x30, [sp], 16       ; Restoring x21 and link register x30
ldp x19, x20, [sp], 16       ; Restoring x19 and x20
ret                          ; Return
