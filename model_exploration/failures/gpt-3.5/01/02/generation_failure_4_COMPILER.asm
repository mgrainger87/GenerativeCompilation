; compiler_errors=2,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwx4sfox2-181da6.s:23:1: error: ADR/ADRP relocations must be GOT relative
; adrp x6, outInt
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwx4sfox2-181da6.s:23:1: error: unknown AArch64 fixup kind!
; adrp x6, outInt
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwx4sfox2-181da6.s:24:1: error: unknown AArch64 fixup kind!
; add x6, x6, :lo12:outInt
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwx4sfox2-181da6.s:26:1: error: ADR/ADRP relocations must be GOT relative
; adrp x7, outDouble
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwx4sfox2-181da6.s:26:1: error: unknown AArch64 fixup kind!
; adrp x7, outDouble
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpwx4sfox2-181da6.s:27:1: error: unknown AArch64 fixup kind!
; add x7, x7, :lo12:outDouble
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; // Define the function with a global label
.global _customFunction

// Function prologue: save callee-saved registers
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, -16]!
stp x21, x22, [sp, -16]!
stp x23, x30, [sp, -16]!

// Copy parameters to local registers
mov x0, x2   // int1 to x0
mov x1, x3   // int2 to x1
mov x2, x4   // double1 to x2
mov x3, x5   // double2 to x3
mov x4, x6   // outInt to x4
mov x5, x7   // outDouble to x5

// Calculate the addresses of outInt and outDouble
adrp x6, outInt
add x6, x6, :lo12:outInt

adrp x7, outDouble
add x7, x7, :lo12:outDouble

// Copy int1 to outInt
str w0, [x6]

// Copy double1 to outDouble
str d2, [x7]

// Function epilogue: restore callee-saved registers and return
ldp x19, x20, [sp], 16
ldp x21, x22, [sp], 16
ldp x23, x30, [sp], 16
ret

.section __DATA,__data
.align 3
outInt:
.space 4

.align 3
outDouble:
.space 8
