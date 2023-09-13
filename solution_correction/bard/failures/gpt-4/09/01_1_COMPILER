; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:1:25: error: unexpected token
; .global _customFunction # Making the function symbol global
;                         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:2:10: error: expected newline
; .align 3 # Aligning the symbol as per arm64 convention
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:4:27: error: unexpected token in argument list
; stp x19, x20, [sp, #-16]! # Push x19 and x20 to the stack for preserving them
;                           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:5:10: error: unexpected token in argument list
; nop # No operation (can be omitted)
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:7:14: error: unexpected token in argument list
; str x0, [x2] # Store int1 into *outInt
;              ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:8:15: error: unexpected token in argument list
; fstr d0, [x3] # Store double1 into *outDouble
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:10:25: error: unexpected token in argument list
; ldp x19, x20, [sp], #16 # Pop x19 and x20 from the stack, restoring their values
;                         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpnc1o8sn6.asm:12:14: error: unexpected token in argument list
; ret # Return from the function
;              ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction          # Making the function symbol global
.align 3                         # Aligning the symbol as per arm64 convention
_customFunction:                 # Mangled name for customFunction according to Clang conventions for C
stp x19, x20, [sp, #-16]!    # Push x19 and x20 to the stack for preserving them
nop                          # No operation (can be omitted)

str x0, [x2]                 # Store int1 into *outInt
fstr d0, [x3]               # Store double1 into *outDouble

ldp x19, x20, [sp], #16     # Pop x19 and x20 from the stack, restoring their values

ret                         # Return from the function
