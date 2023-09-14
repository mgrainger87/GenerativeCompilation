; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplld0vuxf.asm:23:11: error: expect relocation specifier in operand after ':'
; adrp x4, :gotpage:.Ldouble5
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplld0vuxf.asm:44:15: error: unexpected token in '.section' directive
; .section .data
;               ^
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
adrp    x4, :gotpage:.Ldouble5
ldr     x4, [x4, :got_lo12:.Ldouble5]
ldr     d2, [x4]

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

.section    .data
.align      3
.Ldouble5:
.double  5.0
