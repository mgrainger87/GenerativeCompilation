; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: 1
; 	Integer 2: 2
; 	Double 1: 3.000000
; 	Double 2: 4.000000
; Expected outputs:
; 	Integer: 2
; 	Double: 0.750000
; Actual outputs:
; 	Integer: 2
; 	Double: 0.000000
; 
.global _helperFunction
_helperFunction:
// Divide the two floating point numbers and store the result in d0
fdiv d0, d0, d1
// Return from the function
ret

.global _customFunction
_customFunction:
// Save link register (x30) to stack
stp x30, xzr, [sp, #-16]!

// Set the value at outInt to int2
str w1, [x2]

// Move double1 and double2 to d0 and d1 respectively using fmov
fmov d0, d2
fmov d1, d3

// Call helperFunction
bl _helperFunction

// The result from helperFunction is in d0, store it to outDouble
str d0, [x3]

// Restore link register (x30) from stack
ldp x30, xzr, [sp], #16

// Return from the function
ret
