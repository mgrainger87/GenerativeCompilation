; compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp_gyq36gq.asm:24:14: error: index must be an integer in range [-256, 255].
; ldr d2, [x4, .Ldouble5]
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save the link register (lr) to the stack
stp     lr, x30, [sp, #-16]!

// Check if int1 > 10
cmp     w0, #10
ble     .Lelse_int

// If int1 > 10, compute int1 * int2 and store in *outInt
mul     w4, w0, w1
str     w4, [x2]
b       .Lend_int

.Lelse_int:
// Else compute int1 + int2 and store in *outInt
add     w4, w0, w1
str     w4, [x2]

.Lend_int:

// Load immediate floating point value 5.0 into d2
adrp    x4, .Ldouble5
ldr     d2, [x4, .Ldouble5]

// Check if double2 < 5.0
fcmp    d1, d2
bge     .Lelse_double

// If double2 < 5.0, store double1 in *outDouble
str     d0, [x3]
b       .Lend_function

.Lelse_double:
// Else store double2 in *outDouble
str     d1, [x3]

.Lend_function:
// Restore the link register (lr) from the stack
ldp     lr, x30, [sp], #16
ret

.data
.align  3
.Ldouble5:
.double  5.0
