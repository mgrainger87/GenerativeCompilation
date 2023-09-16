; compiler_errors=0,linker_errors=1,execution_errors=3,correctness_errors=3
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: 5
; 	Integer 2: 3
; 	Double 1: 2.500000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: 11
; 	Double: 0.000000
; Actual outputs:
; 	Integer: 0
; 	Double: 0.000000
; 
.align 2
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register
mov x29, sp                 // Set frame pointer

cbz x4, skip_outInt         // If x4 (outInt) is NULL, jump to skip_outInt

fcvtzs w6, d0               // Convert double1 to integer and store in w6
mul w6, w6, w1              // Multiply w6 with int2 (w1)
add w6, w6, w0              // Add int1 (w0) to w6
str w6, [x4]                // Store result into *outInt

skip_outInt:
cbz x5, end                 // If x5 (outDouble) is NULL, jump to end

fmov d7, #0.0               // Load 0.0 into floating-point register d7
str d7, [x5]                // Store to *outDouble

end:
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret
