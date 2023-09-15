; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=1
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
.global _customFunction

.align 2
_helperFunction:
fneg    d0, d0
ret

.align 2
_customFunction:
// Save link register to stack
str     lr, [sp, #-16]!

// Store int1 to *outInt
str     w0, [x2]

// Call helperFunction with double2
bl      _helperFunction

// Store result of helperFunction to *outDouble
str     d0, [x3]

// Restore link register from stack
ldr     lr, [sp], #16

ret
