; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0azml_qv.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0azml_qv.asm:14:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align 2
_customFunction:
// Store the link register to the stack
stp lr, [sp, #-16]!

// *outInt = int2;
str w1, [x2]

// *outDouble = double1;
str d0, [x3]

// Restore the link register
ldp lr, [sp], #16

// Return
ret
