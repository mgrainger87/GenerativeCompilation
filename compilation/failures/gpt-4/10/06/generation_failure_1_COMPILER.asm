; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdj7wa254.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdj7wa254.asm:26:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
.align 2
_customFunction:
// Save the link register to stack (for returning later)
stp     lr, [sp, #-16]!

// Calculate int1 + int2 + 5
add     w4, w0, w1      // w4 = int1 + int2
add     w4, w4, #5      // w4 = w4 + 5

// Store the result to *outInt
str     w4, [x2]

// Load 5.0 into a floating point register
adrp    x5, :got:5.0
ldr     d4, [x5, :got_lo12:5.0]

// Calculate double1 + double2 + 5.0
fadd    d4, d0, d1      // d4 = double1 + double2
fadd    d4, d4, d4      // d4 = d4 + 5.0

// Store the result to *outDouble
str     d4, [x3]

// Restore the link register and return
ldp     lr, [sp], #16
ret
