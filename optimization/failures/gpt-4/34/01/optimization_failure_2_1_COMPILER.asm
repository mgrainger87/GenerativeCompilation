; solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpy_kd4sog.asm:5:14: error: invalid operand for instruction
; madd w8, w0, #3, wzr ; (w0 * 3) + 0 -> w8
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; _customFunction:
.cfi_startproc
; %bb.0:
; Calculate int1 * 3 directly
madd	w8, w0, #3, wzr   ; (w0 * 3) + 0 -> w8

; Store result in *outInt
str	w8, [x2]

; Multiply double2 by 0.25 directly
fmov	d2, #0.25000000
fmul	d0, d1, d2

; Store result in *outDouble
str	d0, [x3]

ret
.cfi_endproc
