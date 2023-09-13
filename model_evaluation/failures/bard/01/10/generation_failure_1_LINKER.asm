; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp2tu0bxp9.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmpvac7aag3.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .text
.global customFunction
customFunction:
// Save the caller-saved registers
stp x0, x1, [sp, #-16]!
stp x2, x3, [sp, #-32]!

// Get the arguments
ldr w0, [sp, #40] // int int1
ldr w1, [sp, #44] // int int2
ldr d0, [sp, #48] // double double1
ldr d1, [sp, #56] // double double2

// Store the results
str w0, [x4] // *outInt = int1
str d0, [x5] // *outDouble = double1

// Restore the caller-saved registers
ldp x0, x1, [sp], #16
ldp x2, x3, [sp], #32

ret
