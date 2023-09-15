; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7etvyyz8.asm:33:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7etvyyz8.asm:36:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl	_customFunction
.align	2
_customFunction:
// Save link register and callee-saved registers
stp	x29, x30, [sp, #-16]!
mov	x29, sp

// Compare double2 (d1) with immediate value 10
fmov	d8, #10.0
fcmp	d1, d8

// If double2 is not less than 10, jump to the else part
b.ge	.Lelse

// True part: *outInt = int2
str	w1, [x2]

// *outDouble = double1 * double2
fmul	d9, d0, d1
str	d9, [x3]

// Restore link register and return
ldp	x29, x30, [sp], #16
ret

.Lelse:
// Prepare arguments for recursive function call

// int1 + 2 -> x0
add	w0, w0, #2

// double1 + 1 -> d0
fadd	d0, d0, #1.0

// double2 - 1 -> d1
fsub	d1, d1, #1.0

// Call customFunction recursively
bl	_customFunction

// Restore link register and return
ldp	x29, x30, [sp], #16
ret
