; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp674s3cp4.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp674s3cp4.asm:41:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp674s3cp4.asm:45:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl _customFunction
.align 2
_customFunction:
// Save link register to the stack
stp     lr, [sp, #-16]!

// Check if int1 (x0) > 10
cmp     w0, #10
bls     .LIntAdd   // If less or equal to 10, jump to addition

// int1 * int2
mul     w4, w0, w1
b       .LIntStore

.LIntAdd:
// int1 + int2
add     w4, w0, w1

.LIntStore:
// Store result to outInt
str     w4, [x2]

// Load 5.0 into a floating point register (d2)
adrp    x4, :got:.LDouble5
ldr     d2, [x4, #:got_lo12:.LDouble5]

// Check if double2 (d1) < 5.0
fcmp    d1, d2
bge     .LDoubleStore2

// Store double1 to outDouble
str     d0, [x3]
b       .LReturn

.LDoubleStore2:
// Store double2 to outDouble
str     d1, [x3]

.LReturn:
// Restore link register and return
ldp     lr, [sp], #16
ret

// Constant for 5.0
.section    .data
.align      3
.LDouble5:
.double     5.0
