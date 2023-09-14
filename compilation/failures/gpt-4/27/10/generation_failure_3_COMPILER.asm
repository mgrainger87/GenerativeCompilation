; compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpi3ah9cs5-dbc093.s:12:1: error: ADR/ADRP relocations must be GOT relative
; adrp x4, _double_literal_1_0
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpi3ah9cs5-dbc093.s:12:1: error: unknown AArch64 fixup kind!
; adrp x4, _double_literal_1_0
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpi3ah9cs5-dbc093.s:13:1: error: unknown AArch64 fixup kind!
; add x4, x4, :lo12:_double_literal_1_0
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction

_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compute the address of _double_literal_1_0 and load it into d5
adrp x4, _double_literal_1_0
add x4, x4, :lo12:_double_literal_1_0
ldr d5, [x4]

// Store 1.0 to *outDouble
str d5, [x3]

// Initialize loop counter i to 0
mov w4, wzr

_loop_start:
// Check loop condition: i < int1
cmp w4, w0
b.ge _loop_end

// Multiply *outDouble by double1 * double2
fmul d5, d0, d1
ldr d6, [x3]
fmul d6, d6, d5
str d6, [x3]

// Increment loop counter i
add w4, w4, #1
b _loop_start

_loop_end:
// Set *outInt to 0
mov w4, wzr
str w4, [x2]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret

_double_literal_1_0:
.double 1.0
