; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpvz136oqp.asm:13:13: error: invalid operand for instruction
; mul w0, w0, #9
;             ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpvz136oqp.asm:17:10: error: expected compatible register or floating-point constant
; fmov d1, #1.9
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.section    __TEXT,__literal8,8byte_literals
.p2align    3                               ; -- Begin function customFunction
lCPI0_0:
.quad    0x3ffe666666666666              ; double 1.8999999999999999
.section    __TEXT,__text,regular,pure_instructions
.globl    _customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; Multiplying int1 by 9 and storing directly to *outInt
mul    w0, w0, #9
str    w0, [x2]

; Multiplying double1 by 1.9 and storing directly to *outDouble
fmov    d1, #1.9
fmul    d0, d0, d1
str    d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
