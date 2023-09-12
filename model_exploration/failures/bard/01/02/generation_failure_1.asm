; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8geski_z.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmpujdc4ibt.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; // Function prologue
.globl customFunction
customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!

// Load parameters
mov x19, x0 // int1
mov x20, x1 // int2
ldr d0, [x2] // double1
ldr d1, [x3] // double2

// Store output values
str x19, [x4] // outInt
str d0, [x5] // outDouble

// Restore callee-saved registers
ldp x19, x20, [sp], #16

// Return
ret
