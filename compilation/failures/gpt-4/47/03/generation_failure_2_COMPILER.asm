; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpccjubodx.asm:12:9: error: invalid operand for instruction
; mov d0, d1 ; move double2 from d1 to d0
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
_helperFunction:
fneg d0, d0     ; negate the value in d0 and store the result in d0
ret             ; return

.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; save frame and link register
mov x29, sp                ; set frame pointer

str x0, [x2]               ; *outInt = int1
mov d0, d1                 ; move double2 from d1 to d0
bl _helperFunction         ; call helperFunction(double2)
str d0, [x3]               ; *outDouble = result

ldp x29, x30, [sp], #16   ; restore frame and link register
ret                       ; return
