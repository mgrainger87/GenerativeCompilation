; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp5rw0sgih-c35f0f.s:20:1: error: unknown AArch64 fixup kind!
; adr x4, one_point_zero
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Save callee-saved registers and link register
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register onto the stack
mov x29, sp                 // Set the frame pointer to the current stack pointer

// Check if int1 (w0) is less than or equal to 0
cmp w0, #0
ble .Lis_leq_zero

// Else branch for the recursive call
sub w0, w0, #1              // Decrement int1
add w1, w1, #1              // Increment int2

// Load 1.0 into d2
adr x4, one_point_zero      // Get the address of one_point_zero into x4
ldr d2, [x4]                // Load the value from the address into d2

fadd d0, d0, d2             // Add 1 to double1 using d2
bl _customFunction          // Recursive call

// Restore registers and return
ldp x29, x30, [sp], #16     // Restore frame pointer and link register from the stack
ret

.Lis_leq_zero:
// int1 is less than or equal to 0
str w1, [x2]                // Store int2 to *outInt
str d1, [x3]                // Store double2 to *outDouble

// Restore registers and return
ldp x29, x30, [sp], #16     // Restore frame pointer and link register from the stack
ret

.data
.balign 8
one_point_zero: .double 1.0
