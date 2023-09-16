; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplzlpyfto.asm:8:5: error: unexpected floating point literal
; beq .1equal
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmplzlpyfto.asm:21:1: error: unexpected token at start of statement
; .1equal:
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.globl _customFunction
.align 2
_customFunction:
// Compare int1 (x0) with int2 (x1)
cmp w0, w1

// If int1 == int2, then we branch to the equal block
beq .1equal

// If int1 != int2, we prepare to call the function recursively
add w0, w0, #1        // int1 + 1
sub w1, w1, #1        // int2 - 1

// Save lr since we're about to make a function call
stp x30, x29, [sp, #-16]!
bl _customFunction
// Restore lr after the function call
ldp x30, x29, [sp], #16
ret

.1equal:
// int1 == int2
// Set *outInt = int1
str w0, [x2]

// Set *outDouble = double1
fmov d0, d0
str d0, [x3]
ret
