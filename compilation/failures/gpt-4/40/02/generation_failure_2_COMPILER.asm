; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpks8vylys.asm:10:14: error: index must be an integer in range [-256, 255].
; ldr d2, [x4, double_10_offset]
;              ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpks8vylys.asm:30:14: error: index must be an integer in range [-256, 255].
; ldr d4, [x5, float_1_offset]
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction

_customFunction:
// Save the link register (return address) and other callee-saved registers we'll use
stp x29, x30, [sp, #-16]!  // store pair of registers and pre-decrement stack pointer by 16 bytes
mov x29, sp  // set frame pointer

// Compare double2 (d1) with 10.0
adrp x4, double_10_page  // load the address of double_10's page into x4
ldr  d2, [x4, double_10_offset]  // load the offset of double_10 within its page into d2
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
// Load floating-point immediate values
adrp x5, float_1_page
ldr  d4, [x5, float_1_offset]

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

float_1_page:
.quad float_1
float_1_offset:
.quad float_1
float_1:
.float 1.0
