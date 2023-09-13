; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:4:7: error: vector register expected
; push {r4, r5, r6, r7}
;       ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:4:9: error: unknown token in expression
; push {r4, r5, r6, r7}
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:4:9: error: invalid operand
; push {r4, r5, r6, r7}
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:7:5: error: invalid operand for instruction
; mov r0, x0
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:8:5: error: invalid operand for instruction
; mov r1, x1
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:13:5: error: invalid operand for instruction
; str r0, [x4]
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:17:6: error: vector register expected
; pop {r4, r5, r6, r7}
;      ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:17:8: error: unknown token in expression
; pop {r4, r5, r6, r7}
;        ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9z_bg8n4.asm:17:8: error: invalid operand
; pop {r4, r5, r6, r7}
;        ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl customFunction
customFunction:
// Save the caller-saved registers
push {r4, r5, r6, r7}

// Load the parameters into registers
mov r0, x0 // int1
mov r1, x1 // int2
ldr x2, [x2] // double1
ldr x3, [x3] // double2

// Store the output values
str r0, [x4] // *outInt
str x2, [x5] // *outDouble

// Restore the caller-saved registers
pop {r4, r5, r6, r7}

// Return
ret
