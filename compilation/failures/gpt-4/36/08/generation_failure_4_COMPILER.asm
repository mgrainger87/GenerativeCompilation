; compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf9bizvhs-b4269a.s:26:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, .Ldouble_0_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf9bizvhs-b4269a.s:26:1: error: unknown AArch64 fixup kind!
; adrp x4, .Ldouble_0_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf9bizvhs-b4269a.s:27:1: error: unknown AArch64 fixup kind!
; add x4, x4, :lo12:.Ldouble_0_1
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section __DATA,__data
.Ldouble_0_1:
.double 0.1

.text
.global _customFunction
.align  2
_customFunction:
// Save the link register to the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare double1 (d0) and double2 (d1)
fcmp d0, d1
b.eq .equal

// If not equal, modify arguments and make a recursive call

// int2 + 1 -> w1
add w1, w1, #1

// Load 0.1 into a floating point register
adrp x4, .Ldouble_0_1
add x4, x4, :lo12:.Ldouble_0_1
ldr  d4, [x4]

// double1 - 0.1 -> d0
fsub d0, d0, d4

// double2 + 0.1 -> d1
fadd d1, d1, d4

// Make the recursive call
bl _customFunction

// Restore the link register and return
ldp x29, x30, [sp], #16
ret

.equal:
// Set *outInt to int2
str w1, [x2]

// Set *outDouble to double2
str d1, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
