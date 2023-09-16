; compiler_errors=0,linker_errors=2,execution_errors=4,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _main from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpm0fbbw3q.o
; ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpm0fbbw3q.o
; ld: warning: arm64 function not 4-byte aligned: _customFunctionDouble from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpm0fbbw3q.o
; duplicate symbol '_main' in:
;     /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpm0fbbw3q.o
;     /Users/morgang/code/GenerativeCompilation/test_driver.o
; ld: 1 duplicate symbol for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
.global _main
.global _customFunction
.global _customFunctionDouble

_main:
// Prologue
stp x29, x30, [sp, #-16]!
mov x29, sp

// Load command-line arguments into registers
ldr x0, [x0, #0x20]  // int1
ldr x1, [x0, #0x28]  // int2
ldr d0, [x0, #0x30]  // double1
ldr d1, [x0, #0x38]  // double2
ldr x5, [x0, #0x40]  // address for int output
ldr x6, [x0, #0x48]  // address for double output

// Call _customFunction for integer arithmetic
bl _customFunction
str x0, [x5]          // Store the result of customFunction into the int output address

// Call _customFunctionDouble for double arithmetic
bl _customFunctionDouble
str d0, [x6]          // Store the result of customFunctionDouble into the double output address

// End main function
mov x0, #0            // Set exit status code to 0
ldp x29, x30, [sp], #16
ret

_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform integer arithmetic: (x0 + x1)
add x0, x0, x1

// End customFunction
ldp x29, x30, [sp], #16
ret

_customFunctionDouble:
// Prologue
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform double arithmetic: (d0 + d1)
fadd d0, d0, d1

// End customFunctionDouble
ldp x29, x30, [sp], #16
ret
