; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7p2xtu9o.asm:11:10: error: expected compatible register or floating-point constant
; fmov d1, #1.3 ; Load immediate value 1.3 into d1
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
add w0, w0, #10    ; temp = int1 + 10
str w0, [x2]       ; *outInt = temp

fmov    d1, #1.3   ; Load immediate value 1.3 into d1
fmul    d0, d0, d1
str    d0, [x3]    ; *outDouble = double1 * 1.3

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
