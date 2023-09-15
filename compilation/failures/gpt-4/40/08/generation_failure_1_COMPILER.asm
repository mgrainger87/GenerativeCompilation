; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpym8qx3pq.asm:29:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpym8qx3pq.asm:30:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpym8qx3pq.asm:45:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Reserve space for the arguments we might modify for the recursive call
sub sp, sp, #16

// Check if double2 (d1) is less than 10
adrp x4, :got:double_10
ldr  d4, [x4, #:got_lo12:double_10]
fcmp d1, d4
b.ge .else_part

.then_part:
// *outInt = int2;
str w1, [x2]

// *outDouble = double1 * double2;
fmul d5, d0, d1
str  d5, [x3]

b .end_function

.else_part:
// Update the arguments for recursive call
add w0, w0, #2
fadd d0, d0, #1.0
fsub d1, d1, #1.0

// Recursive call
bl _customFunction

b .end_function

.end_function:
// Restore the stack for local variables
add sp, sp, #16

// Restore callee-saved registers and the link register
ldp x29, x30, [sp], #16
ret

.section .data
double_10:
.double 10.0
