; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpk1tl2zjt.asm:17:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align  3
_customFunction:
// Save the link register to preserve return address
stp     x30, x20, [sp, #-16]!

// Check if int1 (x0) <= 0
cmp     w0, #0
ble     .Lstore_values

// Else part: Recursive function call
// Decrement int1, Increment int2
sub     w0, w0, #1
add     w1, w1, #1

// Increment double1
fadd    d0, d0, #1.0

// Recursive call to customFunction
bl      _customFunction

// Restore the link register and return
ldp     x30, x20, [sp], #16
ret

.Lstore_values:
// Store int2 to *outInt
str     w1, [x2]

// Store double2 to *outDouble
str     d1, [x3]

// Restore the link register and return
ldp     x30, x20, [sp], #16
ret
