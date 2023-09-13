; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7gubz7r7-0beeb1.s:15:1: error: unknown AArch64 fixup kind!
; mov x0, int1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7gubz7r7-0beeb1.s:16:1: error: unknown AArch64 fixup kind!
; mov x1, int2
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7gubz7r7-0beeb1.s:17:1: error: unknown AArch64 fixup kind!
; mov x2, double1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7gubz7r7-0beeb1.s:18:1: error: unknown AArch64 fixup kind!
; mov x3, double2
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl customFunction
.align 4

customFunction:

// Save all required registers before branching for a function call.
stp x0, x1, [sp, #-16]!
stp x2, x3, [sp, #-32]!
stp x4, x5, [sp, #-48]!
stp x6, x7, [sp, #-64]!

// Write out which registers are used for which parameters before generating the assembly.
// int int1: x0
// int int2: x1
// double double1: x2
// double double2: x3
// int *outInt: x4
// double *outDouble: x5

// Load the parameters into the appropriate registers.
mov x0, int1
mov x1, int2
mov x2, double1
mov x3, double2

// Store the values of the output parameters.
str x0, [x4]
str x2, [x5]

// Restore all required registers.
ldp x6, x7, [sp, #64]!
ldp x4, x5, [sp, #48]!
ldp x2, x3, [sp, #32]!
ldp x0, x1, [sp, #16]!

// Return from the function.
ret
