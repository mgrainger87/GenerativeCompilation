; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmprl2b9x0h-4df737.s:27:1: error: unknown AArch64 fixup kind!
; adr x4, .LDouble5
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align 2
_customFunction:
// Save link register to the stack
str     lr, [sp, #-16]!

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

// Use adr to compute the address of .LDouble5
adr     x4, .LDouble5
ldr     d2, [x4]

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
ldr     lr, [sp], #16
ret

.data
.align      3
.LDouble5:
.double     5.0
