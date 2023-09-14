; compiler_errors=0,linker_errors=1,execution_errors=4,correctness_errors=5
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
; .align 2
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register
mov x29, sp                 // Set frame pointer

cmp w1, w0                  // Compare int2 (w1) with int1 (w0)
b.gt compute_greater        // If int2 > int1, branch to compute_greater

fcvtzs w7, d1               // Convert double2 to integer and store in w7
mul w7, w7, w1              // Multiply w7 with int2 (w1)
add w7, w7, w0              // Add int1 (w0) to w7
cbz x4, skip_int_store      // Check if x4 is null
str w7, [x4]                // Store result into *outInt
b done_compute              // Branch to done_compute

compute_greater:
fcvtzs w7, d0               // Convert double1 to integer and store in w7
mul w7, w7, w1              // Multiply w7 with int2 (w1)
add w7, w7, w0              // Add int1 (w0) to w7
cbz x4, skip_int_store      // Check if x4 is null
str w7, [x4]                // Store result into *outInt

skip_int_store:
cbz x5, done_compute        // Check if x5 is null
fadd d8, d0, d1             // Add double1 (d0) to double2 (d1)
str d8, [x5]                // Store to *outDouble

done_compute:
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret
