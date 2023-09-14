; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpih3teh0h.asm:25:9: error: Immediate too large for register
; ldr d4, =5.0
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save the link register and frame pointer
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare int1 with 10
cmp w0, #10

// If int1 is not greater than 10, jump to the addition operation
ble 1f

// Multiply int1 and int2 and store the result in outInt
mul w4, w0, w1
str w4, [x2]
b 2f

1:
// Add int1 and int2 and store the result in outInt
add w4, w0, w1
str w4, [x2]

2:
// Load 5.0 into a floating-point register
ldr d4, =5.0
fcmp d1, d4

// If double2 is not less than 5.0, jump to the next operation
bge 3f

// Store double1 in outDouble
fmov d5, d0
str d5, [x3]
b 4f

3:
// Store double2 in outDouble
fmov d5, d1
str d5, [x3]

4:
// Restore the link register and frame pointer, then return
ldp x29, x30, [sp], #16
ret
