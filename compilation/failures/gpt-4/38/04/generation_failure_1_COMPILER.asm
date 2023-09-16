; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp3b6puu42.asm:18:10: error: invalid operand for instruction
; fsub v1, v1, v2
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp3b6puu42.asm:32:10: error: invalid operand for instruction
; fadd v2, v0, v1
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align 3
_customFunction:
// Save the link register (lr) as we have a function call inside
stp     lr, x30, [sp, #-16]!

// Check if int2 (x1) is less than 5
cmp     w1, #5
blt     .Lless_than_5

// Else part for int2 >= 5

// int2 = int2 - 2; x1 = x1 - 2;
sub     w1, w1, #2

// double2 = double2 - 1; v1 = v1 - 1;
fmov    d2, #1.0    // Load 1.0 into d2
fsub    v1, v1, v2  // Subtract 1.0 from double2

// Call customFunction recursively
bl      _customFunction

// Restore link register and return
ldp     lr, x30, [sp], #16
ret

.Lless_than_5:
// *outInt = int1; *x2 = x0;
str     w0, [x2]

// *outDouble = double1 + double2; *x3 = v0 + v1;
fadd    v2, v0, v1
str     d2, [x3]

// Restore link register and return
ldp     lr, x30, [sp], #16
ret
