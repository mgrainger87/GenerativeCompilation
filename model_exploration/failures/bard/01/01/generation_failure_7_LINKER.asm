; compiler_errors=1,linker_errors=5,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmpeanysaio.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
;
// Function signature: void customFunction(int int1, int int2, double double1, double double2, int *outInt, double *outDouble)

// Mangle function name according to Clang conventions for C (not C++). Mark symbols as global where necessary. Align symbols appropriately for arm64.
.globl customFunction
.text
.p2align 4

customFunction:

// Save all required registers before branching for a function call.
stp x0, x1, [sp, #-16]!
stp x2, x3, [sp, #-32]!
stp x4, x5, [sp, #-48]!
stp x6, x7, [sp, #-64]!
stp x8, x9, [sp, #-8]!

// Write out which registers are used for which parameters before generating the assembly.
// int int1: x4
// int int2: x5
// double double1: x6
// double double2: x7
// int *outInt: x8
// double *outDouble: x9

// Load the parameters from the stack.
ldr x4, [sp, #16]
ldr x5, [sp, #24]
ldr x6, [sp, #32]
ldr x7, [sp, #40]

// Store the values of the output parameters.
str x4, [x8]
str x6, [x9]

// Restore all required registers.
ldp x6, x7, [sp, #64]!
ldp x4, x5, [sp, #48]!
ldp x2, x3, [sp, #32]!
ldp x0, x1, [sp, #16]!
ldp x8, x9, [sp], #8

// Return from the function.
ret