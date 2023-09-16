; compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: 10
; 	Integer 2: 0
; 	Double 1: 0.000000
; 	Double 2: 5.500000
; Expected outputs:
; 	Integer: 10
; 	Double: -5.500000
; Actual outputs:
; 	Integer: 10
; 	Double: -0.000000
; 
.global _helperFunction
_helperFunction:
fneg    d0, d0      ; Negate the floating point value in d0 and store result back in d0
ret                 ; Return with result in d0
.global _customFunction
_customFunction:
stp     x30, x29, [sp, #-16]! ; Push x30 (lr) and x29 (fp) onto the stack
mov     x29, sp                ; Set frame pointer

str     w0, [x2]               ; Store int1 to *outInt
bl      _helperFunction        ; Call helperFunction(double2). d1 is already the argument.
str     d0, [x3]               ; Store result of helperFunction to *outDouble

ldp     x30, x29, [sp], #16   ; Pop x30 (lr) and x29 (fp) from the stack
ret                           ; Return
