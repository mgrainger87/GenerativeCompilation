; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpthi93_jq.asm:32:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d8, [x22]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.align	2
.global	_customFunction
.p2align	2
_customFunction:
// Function prologue (stack setup)
stp	x29, x30, [sp, -16]!
add	x29, sp, 0
// Save callee-saved registers
stp	x19, x20, [sp, 16]
stp	x21, x22, [sp, 32]
stp	x23, x24, [sp, 48]
stp	x25, x26, [sp, 64]
stp	x27, x28, [sp, 80]

// Store integer parameters int1 and int2 in x19 and x20
mov	x19, x0
mov	x20, x1

// Store double parameters double1 and double2 in fp registers (d8 and d9)
fmov	d8, x2
fmov	d9, x3

// Store the address of outInt and outDouble in x21 and x22
mov	x21, x4
mov	x22, x5

// Store int1 into *outInt
str	w19, [x21]

// Store double1 into *outDouble
fstr	d8, [x22]

// Function epilogue
// Restore callee-saved registers
ldp	x19, x20, [sp, 16]
ldp	x21, x22, [sp, 32]
ldp	x23, x24, [sp, 48]
ldp	x25, x26, [sp, 64]
ldp	x27, x28, [sp, 80]
// Restore the stack
ldp	x29, x30, [sp], 16
ret
