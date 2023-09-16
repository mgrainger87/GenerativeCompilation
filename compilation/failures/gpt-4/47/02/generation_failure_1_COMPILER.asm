; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmped_lc65l.asm:17:9: error: invalid operand for instruction
; mov d0, d1 ; Move double2 to d0 for the function call
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _helperFunction
.align 2
_helperFunction:
fneg    d0, d0       ; Negate the input double value
ret                 ; Return with the negated value in d0

.globl _customFunction
.align 2
_customFunction:
; Save the link register
stp     lr, x30, [sp, #-16]!

; *outInt = int1;
str     w0, [x2]

; Call helperFunction to compute *outDouble
mov     d0, d1       ; Move double2 to d0 for the function call
bl      _helperFunction

; Store result from helperFunction into *outDouble
str     d0, [x3]

; Restore the link register and return
ldp     lr, x30, [sp], #16
ret
