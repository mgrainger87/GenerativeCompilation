; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpfx5en5oc.asm:9:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Storing the link register to preserve the return address
stp x30, x29, [sp, #-16]!     // Push x30 (link register) and x29 (frame pointer) onto the stack
mov x29, sp                   // Set the frame pointer to the current stack pointer

// The function body
str w0, [x2]                  // Store int1 to the address pointed by outInt
fstr d1, [x3]                 // Store double2 to the address pointed by outDouble

// Restore the link register
ldp x30, x29, [sp], #16       // Pop x30 and x29 off the stack
ret                           // Return to the caller
