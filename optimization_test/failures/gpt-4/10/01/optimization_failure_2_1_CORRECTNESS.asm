; solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: -1000
; 	Integer 2: -1000
; 	Double 1: 0.000000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: -2006
; 	Double: 0.000000
; Actual outputs:
; 	Integer: 6
; 	Double: 0.000000
; 
; .section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub     w0, w0, w1      ; w0 = int1 - int2
add     w0, w0, #6      ; w0 = (int1 - int2) + 6
str     w0, [x2]        ; store the result at the location pointed to by outInt
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
