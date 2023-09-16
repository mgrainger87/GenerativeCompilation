; compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjuw8tdrg.asm:6:9: error: Immediate too large for register
; ldr d2, =0.1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
.align  3

_customFunction:
// Load 0.1 into d2 using PC-relative addressing
ldr     d2, =0.1

// 1. Compare double1 (d0) and double2 (d1)
fcmp    d0, d1

// 2. If double1 and double2 are equal, jump to equal block
beq     L_equal

// 3. If not equal, adjust arguments for recursive call
add     w1, w1, #1               // Increment int2
fsub    d0, d0, d2               // Subtract 0.1 from double1
fadd    d1, d1, d2               // Add 0.1 to double2
bl      _customFunction          // Recursive call

ret

// Equal block
L_equal:
str     w1, [x2]                 // Store int2 to *outInt
str     d1, [x3]                 // Store double2 to *outDouble
ret
