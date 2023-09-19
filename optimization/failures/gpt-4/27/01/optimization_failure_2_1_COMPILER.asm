; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkg6uvp9k.asm:6:17: error: invalid operand for instruction
; mul w8, w8, w1, #3
;                 ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; _customFunction:                        ; @customFunction
.cfi_startproc

; Calculate (int1 + 2) * (int2 + 3)
adds	w8, w0, #2
mul	w8, w8, w1, #3
str	w8, [x2] ; Store result to outInt

; Calculate (double1 + 1.0) * (double2 + 2.0)
fmov	d1, #1.00000000
fadd	d0, d0, d1
fmov	d2, #2.00000000
fadd	d1, d1, d2
fmul	d0, d0, d1
str	d0, [x3] ; Store result to outDouble

ret
.cfi_endproc
