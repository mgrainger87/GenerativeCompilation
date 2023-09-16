; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj1exu_wd.asm:19:9: error: Immediate too large for register
; ldr d3, =3.0
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Preserve frame and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform integer arithmetic: int1 * 3 - int2
// Store result in x4
mov w4, w0     // Copy int1 to w4
lsl w4, w4, #1 // w4 = int1 * 2
add w4, w4, w0 // w4 = int1 * 3
sub w4, w4, w1 // w4 = int1 * 3 - int2

// Store the result at address pointed by outInt
str w4, [x2]

// Perform floating point arithmetic: double1 - double2 * 3
// Use a constant pool to load the immediate value 3.0 into d3
ldr d3, =3.0
fmul d2, d1, d3 // d2 = double2 * 3
fsub d2, d0, d2 // d2 = double1 - double2 * 3

// Store the result at address pointed by outDouble
str  d2, [x3]

// Restore frame and link register
ldp x29, x30, [sp], #16

// Return
ret
