; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp2mghnbgl.asm:17:9: error: expected label or encodable integer pc offset
; adr x6, [x5]
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp,#-16]!
mov x29, sp

// x0 = int1
// x1 = int2
// x2 = double1

// x3 = double2
// x4 = _outInt
// x5 = _outDouble

str w0, [x4] // *_outInt = int1

adr x6, [x5] // Get address of _outDouble pointer
str d2, [x6] // Store double1 to that address

ldp x29, x30, [sp],#16
ret
