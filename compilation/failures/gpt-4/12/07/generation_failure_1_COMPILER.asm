; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpw7ez_36t.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpw7ez_36t.asm:26:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpw7ez_36t.asm:42:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align  2
_customFunction:
// Save link register
stp     lr, [sp, #-16]!

// Compare double1 and double2
fcmp    d0, d1

// Conditional branching based on the comparison result
b.gt    .1_greater_than_label

.0_else_label:
// Execute the else block
// Calculate int1 - int2
sub     w4, w0, w1

// Store result to *outInt
str     w4, [x2]

// Store double2 to *outDouble
fmov    d5, d1
str     d5, [x3]

// Restore link register and return
ldp     lr, [sp], #16
ret

.1_greater_than_label:
// Execute the if block
// Calculate int1 + int2
add     w4, w0, w1

// Store result to *outInt
str     w4, [x2]

// Store double1 to *outDouble
fmov    d5, d0
str     d5, [x3]

// Restore link register and return
ldp     lr, [sp], #16
ret
