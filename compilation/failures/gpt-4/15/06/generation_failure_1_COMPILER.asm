; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj6t_h3fp.asm:13:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpj6t_h3fp.asm:20:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d8, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Compare double1 (d0) with 0.0
fmov    d8, #0.0
fcmp    d0, d8

// Branch if equal to handle the first case
beq     .L0_equals_zero

// If not equal to zero, execute the else block
sub     w8, w0, w1          // Subtract int2 from int1
str     w8, [x2]           // Store the result at outInt
fstr    d0, [x3]           // Store double1 at outDouble
ret

.L0_equals_zero:
add     w8, w0, w1          // Add int1 and int2
str     w8, [x2]            // Store the result at outInt
fmov    d8, #1.0
fstr    d8, [x3]            // Store 1.0 at outDouble
ret
