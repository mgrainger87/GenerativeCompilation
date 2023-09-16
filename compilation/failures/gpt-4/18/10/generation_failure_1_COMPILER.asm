; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjve972cv.asm:39:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save link register (return address)
stp x30, xzr, [sp, #-16]!

// int1 > 10
cmp w0, #10
// If int1 <= 10, jump to the else block
ble 1f

// then block: int1 * int2
mul w4, w0, w1
str w4, [x2]
b 2f

1:  // else block: int1 + int2
add w4, w0, w1
str w4, [x2]

2:  // Load 5.0 into a floating point register
adrp x4, 3f
ldr d4, [x4, #:lo12:3f]
// double2 < 5.0
fcmp d1, d4
// If double2 >= 5.0, jump to the else block
bge 4f

// then block: double1
str d0, [x3]
b 5f

4:  // else block: double2
str d1, [x3]

5:  // Restore link register and return
ldp x30, xzr, [sp], #16
ret

.section .data
.align 3
3:  .double 5.0
