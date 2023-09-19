; solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: Running tests for 100 iterations...
; Test failed on iteration 1:
; Inputs:
; 	Integer 1: -1000
; 	Integer 2: 0
; 	Double 1: -1000.000000
; 	Double 2: 0.000000
; Expected outputs:
; 	Integer: -8000
; 	Double: -16000.000000
; Actual outputs:
; 	Integer: -7000
; 	Double: -16016.000000
; 
; .section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc

; For *outInt = (int1 * 7) + int1;
mov    w8, #8                        ; Load the value 8 into w8
madd   w8, w0, w8, wzr               ; Multiply int1 (w0) by 8 and add zero, result in w8. This effectively calculates (int1 * 8)
sub    w8, w8, w0                   ; Subtract int1 from w8 to get (int1 * 7) + int1
str    w8, [x2]                     ; Store the result to *outInt

; For *outDouble = (double1 * 15) + double1;
fmov   d1, #16.0                    ; Load the value 16.0 into d1
fmul   d0, d0, d1                   ; Multiply double1 (d0) by 16.0, result in d0
fsub   d0, d0, d1                   ; Subtract 1.0 from d0 to get (double1 * 15) + double1
str    d0, [x3]                     ; Store the result to *outDouble

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
