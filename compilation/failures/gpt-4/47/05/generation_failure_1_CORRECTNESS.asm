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
// Saving the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Negating the double value
fneg d0, d0

// Restoring link register
ldp x30, x29, [sp], #16
ret

.global _customFunction
_customFunction:
// Saving the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// *outInt = int1;
str w0, [x2]

// Saving the link register before branching to helperFunction
bl  _helperFunction

// Storing the result of helperFunction in *outDouble
str d0, [x3]

// Restoring link register
ldp x30, x29, [sp], #16
ret
