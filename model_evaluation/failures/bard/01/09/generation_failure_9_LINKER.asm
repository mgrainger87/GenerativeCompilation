; compiler_errors=4,linker_errors=4,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: ltmp0 from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp506i0ksc.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmpf12n7s28.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; // Function prologue
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-32]!

// Load the arguments
ldr x19, [sp, #24] // int1
ldr x20, [sp, #32] // int2
ldr x22, [sp, #40] // double1
ldr x23, [sp, #48] // double2
ldr x24, [sp, #56] // outInt
ldr x25, [sp, #64] // outDouble

// Custom function
// Add the values of `int1` and `int2`
add x21, x19, x20

// Move the values of `int1` and `int2` into integer registers
mov x22, x19
mov x23, x20

// Multiply the values of `double1` and `double2`
// This instruction is invalid because x22 and x23 are integer registers.
// fmul x26, x22, x23

// Store the results
str x21, [x24]
str x22, [x25]

// Function epilogue
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32
ret
