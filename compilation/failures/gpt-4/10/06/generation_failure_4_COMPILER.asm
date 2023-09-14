; compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjgpy9l5e.asm:1:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section .data
.align 3
five_point_zero:
.double 5.0

.text
.global _customFunction
.align 2
_customFunction:
// Save the link register to stack (for returning later)
sub     sp, sp, #16      // Adjust stack pointer
str     lr, [sp]         // Store the link register

// Calculate int1 + int2 + 5
add     w4, w0, w1      // w4 = int1 + int2
add     w4, w4, #5      // w4 = w4 + 5

// Store the result to *outInt
str     w4, [x2]

// Load 5.0 into a floating point register from the data section
adrp    x5, five_point_zero       // Set x5 with the page address of five_point_zero
ldr     d4, [x5, :lo12:five_point_zero]  // Load the value from that page into d4

// Calculate double1 + double2 + 5.0
fadd    d4, d0, d1      // d4 = double1 + double2
fadd    d4, d4, d4      // d4 = d4 + 5.0

// Store the result to *outDouble
str     d4, [x3]

// Restore the link register and return
ldr     lr, [sp]         // Load the link register
add     sp, sp, #16      // Adjust stack pointer back
ret
