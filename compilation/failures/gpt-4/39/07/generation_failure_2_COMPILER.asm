; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:13:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, 1f
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:13:1: error: unknown AArch64 fixup kind!
; adrp x4, 1f
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:14:1: error: unknown AArch64 fixup kind!
; ldr d8, [x4, #:lo12:1f]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:14:1: error: fixup must be 8-byte aligned
; ldr d8, [x4, #:lo12:1f]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:38:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, 2f
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:38:1: error: unknown AArch64 fixup kind!
; adrp x4, 2f
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:39:1: error: unknown AArch64 fixup kind!
; ldr d8, [x4, #:lo12:2f]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkgen_wv-de433d.s:39:1: error: fixup must be 8-byte aligned
; ldr d8, [x4, #:lo12:2f]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save lr and x29 to stack
stp x29, lr, [sp, #-16]!

// Update frame pointer
mov x29, sp

// Load 10.0 into d8 using a constant pool
adrp x4, 1f
ldr d8, [x4, #:lo12:1f]

// Compare double1 (d0) with 10.0
fcmp d0, d8

// If double1 < 10, then jump to .1_else
b.ge .1_else

// *outInt = int1 * int2
mul w4, w0, w1
str w4, [x2]

// *outDouble = double1
str d0, [x3]

// Restore lr and x29 from stack and return
ldp x29, lr, [sp], #16
ret

.1_else:
// int2+2
add w1, w1, #2

// Load 1.0 into d8 using a constant pool
adrp x4, 2f
ldr d8, [x4, #:lo12:2f]

// double1-1
fsub d0, d0, d8

// double2+1
fadd d1, d1, d8

// Call customFunction recursively
bl _customFunction

// Restore lr and x29 from stack and return
ldp x29, lr, [sp], #16
ret

// Constant pool for floating point values
1: .double 10.0
2: .double 1.0
