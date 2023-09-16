; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: helperFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplm2r09a4.o
; ld: warning: arm64 function not 4-byte aligned: customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplm2r09a4.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in test_driver.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
helperFunction:
fadd    d0, d0, d1      // Add the two doubles in d0 and d1 and store the result in d0
ret                     // Return with the result in d0

.global customFunction
customFunction:
// Add int1 and int2
add     w4, w0, w1          // w4 = int1 + int2

// Store the result at the address pointed to by outInt
str     w4, [x2]

// Save link register to stack
stp     lr, xzr, [sp, #-16]! // Push lr to stack (also ensure stack alignment)

// Call helperFunction
bl      helperFunction       // d0 now contains the result of helperFunction

// Load the result to the address pointed to by outDouble
str     d0, [x3]

// Restore link register from stack
ldp     lr, xzr, [sp], #16   // Pop lr from stack

// Return
ret
