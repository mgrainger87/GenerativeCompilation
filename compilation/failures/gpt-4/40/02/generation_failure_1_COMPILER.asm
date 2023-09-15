; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplxyjdkpb.asm:30:15: error: unexpected floating point literal
; fadd d0, d0, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplxyjdkpb.asm:31:15: error: unexpected floating point literal
; fsub d1, d1, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplxyjdkpb.asm:40:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction

_customFunction:
// Save the link register (return address) and other callee-saved registers we'll use
stp x29, x30, [sp, #-16]!  // store pair of registers and pre-decrement stack pointer by 16 bytes
mov x29, sp  // set frame pointer

// Compare double2 (d1) with 10.0
adrp x4, :got:double_10  // load the address of double_10's page into x4
ldr  d2, [x4, #:got_lo12:double_10]  // load the offset of double_10 within its page into d2
fcmp d1, d2  // compare d1 and d2

// If double2 (d1) >= 10, branch to the else part
b.ge else_part

// true part: *outInt = int2;
str w1, [x2]

// *outDouble = double1 * double2;
fmul d3, d0, d1  // d3 = d0 * d1
str  d3, [x3]  // store d3 into *outDouble

// Restore registers and return
ldp x29, x30, [sp], #16  // restore pair of registers and post-increment stack pointer by 16 bytes
ret

else_part:
// customFunction(int1+2, int2, double1+1, double2-1, outInt, outDouble);
add  w0, w0, #2  // w0 = w0 + 2
fadd d0, d0, #1.0  // d0 = d0 + 1.0
fsub d1, d1, #1.0  // d1 = d1 - 1.0

// Call customFunction
bl   _customFunction

// Restore registers and return
ldp x29, x30, [sp], #16  // restore pair of registers and post-increment stack pointer by 16 bytes
ret

.section .data
double_10:
.double 10.0
