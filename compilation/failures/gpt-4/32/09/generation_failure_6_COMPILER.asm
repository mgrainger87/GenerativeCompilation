; compiler_errors=6,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdyy_ap54-fbb9a0.s:19:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, one_point_zero_data
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdyy_ap54-fbb9a0.s:19:1: error: unknown AArch64 fixup kind!
; adrp x4, one_point_zero_data
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Check if int2 (x1) <= 0
cmp x1, #0
ble .L0

// If int2 > 0, call the recursive function
// First, save lr (link register) to stack
stp x30, xzr, [sp, #-16]!

// Prepare arguments for recursive call
add x0, x0, #1      // int1 = int1 + 1
sub x1, x1, #1      // int2 = int2 - 1

// Load address of 1.0 into x4
adrp x4, one_point_zero_data
ldr d2, [x4]        // Load 1.0 into d2
fadd d1, d1, d2     // double2 = double2 + 1

// Call customFunction recursively
bl _customFunction

// Restore lr from the stack
ldp x30, xzr, [sp], #16
ret

.L0:
// If int2 <= 0
str x0, [x2]       // *outInt = int1
str d0, [x3]       // *outDouble = double1
ret

// Constant pool
.align 3
one_point_zero_data:
.double 1.0
