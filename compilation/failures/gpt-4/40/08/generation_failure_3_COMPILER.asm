; compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzeon5ix9-8b6522.s:14:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, :got:double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzeon5ix9-8b6522.s:14:1: error: unknown AArch64 fixup kind!
; adrp x4, :got:double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzeon5ix9-8b6522.s:15:1: error: unknown AArch64 fixup kind!
; ldr x4, [x4, #:got_lo12:double_10]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzeon5ix9-8b6522.s:34:1: error: ADR/ADRP relocations must be GOT relative
; adrp x5, :got:double_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzeon5ix9-8b6522.s:34:1: error: unknown AArch64 fixup kind!
; adrp x5, :got:double_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzeon5ix9-8b6522.s:35:1: error: unknown AArch64 fixup kind!
; ldr x5, [x5, #:got_lo12:double_1]
; ^
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

// Load address of double_10 from the GOT into x4 and then load its value into d4
adrp x4, :got:double_10
ldr  x4, [x4, #:got_lo12:double_10]
ldr  d4, [x4]

// Check if double2 (d1) is less than 10
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
// Load address of double_1 from the GOT into x5 and then load its value into d5
adrp x5, :got:double_1
ldr  x5, [x5, #:got_lo12:double_1]
ldr  d5, [x5]

// Update the arguments for recursive call
add w0, w0, #2
fadd d0, d0, d5
fsub d1, d1, d5

// Recursive call
bl _customFunction

b .end_function

.end_function:
// Restore the stack for local variables
add sp, sp, #16

// Restore callee-saved registers and the link register
ldp x29, x30, [sp], #16
ret

.data
double_10:
.double 10.0

double_1:
.double 1.0
