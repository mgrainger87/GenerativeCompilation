; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
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

// Mangle function name according to Clang conventions for C (not C++)
.globl customFunction
.align 4
customFunction:

// Load parameters
// int int1 = arg1
// int int2 = arg2
// double double1 = arg3
// double double2 = arg4
// int *outInt = arg5
// double *outDouble = arg6
ldr x19, [sp, #24] // int1
ldr x20, [sp, #32] // int2
ldr x22, [sp, #40] // double1
ldr x23, [sp, #48] // double2
ldr x24, [sp, #56] // outInt
ldr x25, [sp, #64] // outDouble

// Store values in output parameters
str x19, [x24]
str x22, [x25]

// Function epilogue
// Restore callee-saved registers
ldp x19, x20, [sp], #16
ldp x21, x22, [sp], #32
ret
