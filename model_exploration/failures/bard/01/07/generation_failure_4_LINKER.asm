; compiler_errors=0,linker_errors=4,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmpkdnam425.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .globl customFunction
.p2align 2
customFunction:
// Save the caller-saved registers
stp x19, x20, [sp, -16]!

// Load the parameters into registers
mov x19, x0 // int int1
mov x20, x1 // int int2
ldr d0, [x2] // double double1
ldr d1, [x3] // double double2

// Store the results
str x19, [x4] // *outInt = int1
str d0, [x5] // *outDouble = double1

// Restore the caller-saved registers
ldp x19, x20, [sp], 16

ret
