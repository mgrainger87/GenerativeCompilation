; solution_number=4,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
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
; 	Integer: -6000
; 	Double: -1500.000000
; Actual outputs:
; 	Integer: -3800
; 	Double: -1500.000000
; 
; .section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Compute int a = int1 * 6 using optimized method: a = (int1 << 2) + int1 + int1
lsl    w0, w0, #2  ; w0 = w0 * 4
add    w0, w0, w9  ; w0 = w0 + w9 (4w0 + w0 = 5w0)
add    w0, w0, w9  ; w0 = w0 + w9 (5w0 + w0 = 6w0)

; Store the result to *outInt
str    w0, [x2]

; Compute double x = double1 * 1.5 directly into d0
fmov    d8, #1.5
fmul    d0, d0, d8

; Store the result to *outDouble
str    d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
