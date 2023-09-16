; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0eg1c205.asm:12:5: error: unexpected floating point literal
; ble .1
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0eg1c205.asm:17:15: error: unexpected floating point literal
; fadd d0, d0, #0.5
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0eg1c205.asm:18:15: error: unexpected floating point literal
; fsub d1, d1, #0.5
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0eg1c205.asm:26:1: error: unexpected token at start of statement
; .1:
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align  2
_customFunction:
// Save link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if double2 (in d1) <= 0
fcmp d1, #0.0

// Use conditional branch to handle the two cases
ble .1 // If condition met, go to label .1

// Else part for recursion:
add w0, w0, #1         // int1 + 1
sub w1, w1, #1         // int2 - 1
fadd d0, d0, #0.5      // double1 + 0.5
fsub d1, d1, #0.5      // double2 - 0.5
bl _customFunction     // Recursive call

// Restore link register and return
ldp x29, x30, [sp], #16
ret

// If part:
.1:
str w0, [x2]           // *outInt = int1
fadd d0, d0, d1        // double1 + double2
str d0, [x3]           // *outDouble = result

// Restore link register and return
ldp x29, x30, [sp], #16
ret
