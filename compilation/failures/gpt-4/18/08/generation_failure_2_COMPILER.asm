; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpyjygq4ms.asm:44:10: error: mach-o section specifier uses an unknown section type
; .section .data,"aw",@progbits
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl _customFunction
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
ldr     lr, [sp], #16
ret

.section    .data,"aw",@progbits
.align      3
.LDouble5:
.double     5.0
