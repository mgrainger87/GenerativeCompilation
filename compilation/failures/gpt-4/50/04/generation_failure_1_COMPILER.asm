; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnpy3pk78.asm:19:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; // This is a static function, so no need to mark it as global.
// However, other functions in the same compilation unit can access it.
_helperFunction:
// Add 10 to x0 and return the result in x0.
add x0, x0, #10
ret
.global _customFunction
_customFunction:
// Preserve the link register (lr) before making the function call.
stp lr, x30, [sp, #-16]!  // Push lr and x30 onto the stack and update the stack pointer.

// Call helperFunction using the int1 parameter (x0).
bl _helperFunction  // After this call, x0 will contain the result of helperFunction(int1).

// Load the result into the memory address pointed to by outInt (x2).
str x0, [x2]

// Store the value of double2 (d1) into the memory address pointed to by outDouble (x3).
fstr d1, [x3]

// Restore the link register.
ldp lr, x30, [sp], #16  // Pop lr and x30 off the stack and update the stack pointer.

ret
