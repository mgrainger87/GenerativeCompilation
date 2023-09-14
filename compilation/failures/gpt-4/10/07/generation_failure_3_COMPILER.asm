; compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpn94s60od-d5225a.s:18:1: error: ADR/ADRP relocations must be GOT relative
; adrp x5, five_point_0
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpn94s60od-d5225a.s:18:1: error: unknown AArch64 fixup kind!
; adrp x5, five_point_0
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpn94s60od-d5225a.s:19:1: error: unknown AArch64 fixup kind!
; ldr d5, [x5, #:lo12:five_point_0]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section __TEXT,__text,regular,pure_instructions
.globl _customFunction
.align 2
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
mov x29, sp                // Update frame pointer

// *outInt = int1 + int2 + 5
add w4, w0, w1             // w4 = int1 + int2
add w4, w4, #5             // w4 = w4 + 5
str w4, [x2]               // Store w4 to *outInt

// Load 5.0 into a floating point register
adrp x5, five_point_0      // Get the address page of the constant
ldr  d5, [x5, #:lo12:five_point_0] // Load the constant into d5

// *outDouble = double1 + double2 + 5.0
fadd d6, d0, d1            // d6 = double1 + double2
fadd d6, d6, d5            // d6 = d6 + 5.0
str  d6, [x3]              // Store d6 to *outDouble

// Epilogue
ldp x29, x30, [sp], #16    // Restore frame pointer and link register
ret

.section __DATA,__data
.align 3
five_point_0:
.double 5.0
