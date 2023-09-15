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
; .global _helperFunction
_helperFunction:
fneg d0, d0     ; negate the value in d0 and store the result in d0
ret             ; return
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!  ; save frame and link register
mov x29, sp                ; set frame pointer

str x0, [x2]               ; *outInt = int1
bl _helperFunction         ; call helperFunction(double2)
str d0, [x3]               ; *outDouble = result

ldp x29, x30, [sp], #16   ; restore frame and link register
ret                       ; return
