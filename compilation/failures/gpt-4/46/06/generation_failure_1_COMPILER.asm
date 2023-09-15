; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp2z31zwze.asm:21:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _helperFunction
_helperFunction:
// Multiply a and b
mul w0, w0, w1

// Return result in x0
ret
.global _customFunction
_customFunction:
// Store Link Register (to return to caller)
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction with int1 and int2
bl _helperFunction

// Store result (from x0) to *outInt (address in x2)
str w0, [x2]

// Store double2 to *outDouble
fstr d1, [x3]

// Restore Link Register and Frame Pointer
ldp x30, x29, [sp], #16

// Return to caller
ret
