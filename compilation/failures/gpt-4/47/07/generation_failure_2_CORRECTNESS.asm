; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=1
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
fneg    d0, d0
ret

.global _customFunction
_customFunction:
// Save the link register (lr) and frame pointer (x29)
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// *outInt = int1;
str     w0, [x2]

// Call helperFunction(double2);
bl      _helperFunction

// *outDouble = helperFunction(double2);
str     d0, [x3]

// Restore lr and frame pointer
ldp     x29, x30, [sp], #16

ret
