; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpb2liekoh.asm:26:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare int2 with 5
cmp w1, #5
b.ge .Lrecursive_call

.Lless_than_5:
// If int2 is less than 5, *outInt = int1;
str w0, [x2]

// *outDouble = double1 + double2;
fadd d2, d0, d1
str d2, [x3]

// Restore link register and return
ldp x30, x29, [sp], #16
ret

.Lrecursive_call:
// Adjust arguments for the recursive call
sub w1, w1, #2
fsub d1, d1, #1.0

// Make the recursive call
bl _customFunction

// Restore link register and return
ldp x30, x29, [sp], #16
ret
