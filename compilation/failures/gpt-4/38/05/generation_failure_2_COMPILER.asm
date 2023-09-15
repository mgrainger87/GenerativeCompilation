; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpxstw8h09-ced72a.s:18:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, .L1_constant
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpxstw8h09-ced72a.s:18:1: error: unknown AArch64 fixup kind!
; adrp x4, .L1_constant
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpxstw8h09-ced72a.s:19:1: error: unknown AArch64 fixup kind!
; ldr d4, [x4, #:lo12:.L1_constant]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global customFunction
customFunction:
// Save link register and required callee-saved registers
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// Check the condition (int2 < 5)
cmp     w1, #5
blt     .LessThan5

// Else part (Recursive call)
sub     w1, w1, #2       // int2 = int2 - 2

// Load 1.0 into a floating-point register and subtract it from double2
adrp    x4, .L1_constant
ldr     d4, [x4, #:lo12:.L1_constant]
fsub    d1, d1, d4

bl      customFunction  // Recursive call
ldp     x29, x30, [sp], #16  // Restore registers
ret

.LessThan5:
// *outInt = int1
str     w0, [x2]

// *outDouble = double1 + double2
fadd    d4, d0, d1
str     d4, [x3]

ldp     x29, x30, [sp], #16  // Restore registers
ret

.L1_constant:
.double 1.0
