; compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in test_driver.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .global customFunction
.align 3
customFunction:
// Store lr (link register) to stack since we need to preserve it
str     lr, [sp, #-16]!

// Add the integer values
add     w4, w0, w1

// Store the result of the integer addition to *outInt (which is in x2)
str     w4, [x2]

// Load the immediate values for the floating point addition to registers
fadd    d2, d0, d1

// Store the result of the floating point addition to *outDouble (which is in x3)
str     d2, [x3]

// Restore lr from stack
ldr     lr, [sp], #16

// Return from function
ret
