; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkh1ta1ty-0e725d.s:12:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkh1ta1ty-0e725d.s:12:1: error: unknown AArch64 fixup kind!
; adrp x4, double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkh1ta1ty-0e725d.s:13:1: error: unknown AArch64 fixup kind!
; add x4, x4, :lo12:double_10
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkh1ta1ty-0e725d.s:33:1: error: ADR/ADRP relocations must be GOT relative
; adrp x5, float_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkh1ta1ty-0e725d.s:33:1: error: unknown AArch64 fixup kind!
; adrp x5, float_1
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpkh1ta1ty-0e725d.s:34:1: error: unknown AArch64 fixup kind!
; add x5, x5, :lo12:float_1
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Save the link register (return address) and other callee-saved registers we'll use
stp x29, x30, [sp, #-16]!  // store pair of registers and pre-decrement stack pointer by 16 bytes
mov x29, sp  // set frame pointer

// Load address of double_10
adrp x4, double_10
add x4, x4, :lo12:double_10
ldr  d2, [x4]  // load the value of double_10 into d2
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
// Load address of float_1
adrp x5, float_1
add x5, x5, :lo12:float_1
ldr  d4, [x5]

// customFunction(int1+2, int2, double1+1, double2-1, outInt, outDouble);
add  w0, w0, #2  // w0 = w0 + 2
fadd d0, d0, d4  // d0 = d0 + 1.0
fsub d1, d1, d4  // d1 = d1 - 1.0

// Call customFunction
bl   _customFunction

// Restore registers and return
ldp x29, x30, [sp], #16  // restore pair of registers and post-increment stack pointer by 16 bytes
ret

.data
.align 3
double_10:
.double 10.0

float_1:
.float 1.0
