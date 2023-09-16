; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4ix74fy0-9d5b4f.s:14:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4ix74fy0-9d5b4f.s:14:1: error: unknown AArch64 fixup kind!
; adrp x4, double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4ix74fy0-9d5b4f.s:33:1: error: ADR/ADRP relocations must be GOT relative
; adrp x5, double_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp4ix74fy0-9d5b4f.s:33:1: error: unknown AArch64 fixup kind!
; adrp x5, double_1
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Reserve space for the arguments we might modify for the recursive call
sub sp, sp, #16

// Load floating point constant 10 into d4 for comparison
adrp x4, double_10
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
// Load floating point constant 1 into d4 for addition and subtraction
adrp x5, double_1
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
