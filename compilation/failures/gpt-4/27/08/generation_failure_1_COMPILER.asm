; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpityaqxnr.asm:10:14: error: invalid operand for instruction
; fmul d2, d2, [x3]
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; _customFunction:
stp x29, x30, [sp, #-16]!
mov x29, sp
adrp x4, :got:1.0
ldr d2, [x4, #:got_lo12:1.0]
str d2, [x3]
mov w5, wzr
1:  cbz w0, 3f
fmul d2, d0, d1
fmul d2, d2, [x3]
str d2, [x3]
add w5, w5, #1
sub w0, w0, #1
b 1b
3:  mov w6, wzr
str w6, [x2]
ldp x29, x30, [sp], #16
ret
