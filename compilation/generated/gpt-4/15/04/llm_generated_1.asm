//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!   ; Save frame pointer and link register to stack
mov x29, sp                ; Set frame pointer to current stack pointer

fcmp d0, #0.0              ; Compare double1 with 0.0
b.ne 1f                    ; If not equal, branch to else block

; True block (double1 == 0.0)
add w4, w0, w1             ; int1 + int2
str w4, [x2]               ; Store result to *outInt
fmov d5, #1.0              ; Load 1.0 into floating point register
str d5, [x3]               ; Store to *outDouble
b 2f                       ; Branch to end

1:  ; Else block
sub w4, w0, w1             ; int1 - int2
str w4, [x2]               ; Store result to *outInt
str d0, [x3]               ; Store double1 to *outDouble

2:  ; End
ldp x29, x30, [sp], #16    ; Restore frame pointer and link register from stack
ret
