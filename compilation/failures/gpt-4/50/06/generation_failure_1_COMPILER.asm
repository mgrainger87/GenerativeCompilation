; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpt16869lj.asm:17:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global helperFunction
helperFunction:
add x0, x0, #10     // a = a + 10
ret
.global customFunction
customFunction:
// Save the link register since we're making a function call
stp x30, x19, [sp, #-16]!

// Call helperFunction with int1
bl helperFunction

// Store the result in *outInt
str w0, [x2]

// Store double2 in *outDouble
fstr d1, [x3]

// Restore the saved registers
ldp x30, x19, [sp], #16

ret
