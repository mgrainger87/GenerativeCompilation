; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdqxpjumj.asm:16:15: error: unexpected floating point literal
; fadd d2, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save the link register and any other necessary registers
stp x30, x20, [sp, #-16]!

// Check if int2 (x1) is less than or equal to 0
cmp x1, #0
ble .L0_return_directly

// Else branch (recursive function call)
// int1+1
add x4, x0, #1
// int2-1
sub x5, x1, #1
// double2+1
fadd d2, d1, #1.0
// Call customFunction
bl _customFunction
// Restore the link register and return
ldp x30, x20, [sp], #16
ret

.L0_return_directly:
// *outInt = int1;
str w0, [x2]
// *outDouble = double1;
str d0, [x3]
// Restore the link register and return
ldp x30, x20, [sp], #16
ret
