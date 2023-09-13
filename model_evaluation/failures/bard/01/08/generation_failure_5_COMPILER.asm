; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpee038_68-7e4546.s:10:1: error: unknown AArch64 fixup kind!
; mov w0, int1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpee038_68-7e4546.s:11:1: error: unknown AArch64 fixup kind!
; mov w1, int2
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl customFunction
customFunction:
// Save the caller-saved registers
sub sp, sp, #32 // Allocate 32 bytes on the stack

// Load the parameters into registers
mov w0, int1 // int1
mov w1, int2 // int2
ldr x2, [x2] // double1
ldr x3, [x3] // double2

// Store the output values
str w0, [x4] // *outInt
str x2, [x5] // *outDouble

// Restore the caller-saved registers
add sp, sp, #32 // Pop 32 bytes from the stack

// Return
ret
