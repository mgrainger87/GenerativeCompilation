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
fneg d0, d0  ; negate the value in d0
ret          ; return
.global _customFunction
_customFunction:
// Saving link register to the stack
stp x30, xzr, [sp, #-16]!  ; push x30 (link register) and xzr (just to align the stack)

// Task 1: Set *outInt to int1
str w0, [x2]  ; store the value in x0 (int1) to the address in x2 (outInt)

// Task 2: Call helperFunction for double2
bl _helperFunction  ; call helperFunction. double2 is already in d1 which is what helperFunction will use as input.

// Store the result (now in d0) to outDouble
str d0, [x3]

// Restore link register
ldp x30, xzr, [sp], #16  ; pop x30 and xzr off the stack

ret
