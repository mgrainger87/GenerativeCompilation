; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpklfsul0m.asm:30:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align 2
_customFunction:
// Preserve link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Check if int2 < 5
cmp w1, #5
b.ge .Lrecurse

// If int2 < 5
// *outInt = int1;
str w0, [x2]

// *outDouble = double1 + double2;
fadd d4, d0, d1
str d4, [x3]

// Return from the function
ldp x30, x29, [sp], #16
ret

.Lrecurse:
// If int2 >= 5
// Recursively call customFunction with modified arguments

// Adjust arguments
sub w1, w1, #2
fsub d1, d1, #1.0

// Store arguments that might be overwritten by function call
stp x2, x3, [sp, #-16]!
stp d0, d1, [sp, #-16]!

// Call customFunction
bl _customFunction

// Restore arguments
ldp d0, d1, [sp], #16
ldp x2, x3, [sp], #16

// Return from the function
ldp x30, x29, [sp], #16
ret
