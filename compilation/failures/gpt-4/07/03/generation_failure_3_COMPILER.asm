; compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpig15syzh.asm:20:13: error: unexpected token in argument list
; adrp x5, 3.0_data
;             ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpig15syzh.asm:21:24: error: unexpected token in argument list
; ldr d3, [x5, #:lo12:3.0_data]
;                        ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpig15syzh.asm:35:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpig15syzh.asm:37:1: error: unexpected token at start of statement
; 3.0_data:
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Preserve frame and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform integer arithmetic: int1 * 3 - int2
// Store result in x4
mov w4, w0     // Copy int1 to w4
lsl w4, w4, #1 // w4 = int1 * 2
add w4, w4, w0 // w4 = int1 * 3
sub w4, w4, w1 // w4 = int1 * 3 - int2

// Store the result at address pointed by outInt
str w4, [x2]

// Perform floating point arithmetic: double1 - double2 * 3

// Load the immediate value 3.0 into d3 using ADRP and LDR pair
adrp x5, 3.0_data
ldr  d3, [x5, #:lo12:3.0_data]
fmul d2, d1, d3 // d2 = double2 * 3
fsub d2, d0, d2 // d2 = double1 - double2 * 3

// Store the result at address pointed by outDouble
str  d2, [x3]

// Restore frame and link register
ldp x29, x30, [sp], #16

// Return
ret

// Constant pool for the floating point value 3.0
.section .data
.align 3
3.0_data:
.double 3.0
