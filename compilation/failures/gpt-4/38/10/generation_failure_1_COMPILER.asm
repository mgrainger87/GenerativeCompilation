; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp5dqu8p0j.asm:13:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save link register and other callee saved registers
stp     x29, x30, [sp, #-16]!  // save FP and LR to stack
mov     x29, sp               // set FP to current SP

// Check if int2 (x1) is less than 5
cmp     w1, #5                // Compare int2 with 5
blt     .less_than_five       // Branch if int2 is less than 5

// Else part
sub     w1, w1, #2            // int2 = int2 - 2
fsub    d1, d1, #1.0          // double2 = double2 - 1.0
bl      _customFunction       // recursive call
ldp     x29, x30, [sp], #16   // restore FP and LR from stack
ret

.less_than_five:
str     w0, [x2]              // *outInt = int1
fadd    d4, d0, d1            // d4 = double1 + double2
str     d4, [x3]              // *outDouble = d4
ldp     x29, x30, [sp], #16   // restore FP and LR from stack
ret
