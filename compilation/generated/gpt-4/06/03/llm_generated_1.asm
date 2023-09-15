//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; Save frame pointer and link register onto the stack
mov x29, sp               ; Set frame pointer to the current stack pointer

; Calculating int1 + int2 * 2
lsl w4, w1, 1             ; Multiply int2 by 2, result in w4
add w4, w4, w0            ; Add int1, result in w4
str w4, [x2]              ; Store result to *outInt

; Calculating double1 * 2 + double2
fmov d2, #2.0             ; Load immediate floating point value 2.0 to d2
fmul d3, d0, d2           ; Multiply double1 by 2, result in d3
fadd d3, d3, d1           ; Add double2, result in d3
str d3, [x3]              ; Store result to *outDouble

ldp x29, x30, [sp], #16   ; Restore frame pointer and link register from the stack
ret                       ; Return
