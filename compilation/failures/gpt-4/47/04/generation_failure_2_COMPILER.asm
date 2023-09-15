; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpa8qrhq5c.asm:11:9: error: invalid operand for instruction
; mov d0, d1 ; Move double2 to d0 to serve as the argument for helperFunction
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _helperFunction
_helperFunction:
fneg    d0, d0      ; Negate the floating point value in d0 and store result back in d0
ret                 ; Return with result in d0
.global _customFunction
_customFunction:
stp     x30, x29, [sp, #-16]! ; Push x30 (lr) and x29 (fp) onto the stack
mov     x29, sp                ; Set frame pointer

str     w0, [x2]               ; Store int1 to *outInt
mov     d0, d1                 ; Move double2 to d0 to serve as the argument for helperFunction
bl      _helperFunction        ; Call helperFunction(double2)
str     d0, [x3]               ; Store result of helperFunction to *outDouble

ldp     x30, x29, [sp], #16   ; Pop x30 (lr) and x29 (fp) from the stack
ret                           ; Return
