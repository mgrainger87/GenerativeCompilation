; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp688s7xlb.asm:5:9: error: invalid operand for instruction
; stp lr, [sp, #-16]!
;         ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp688s7xlb.asm:26:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp688s7xlb.asm:32:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp688s7xlb.asm:36:9: error: invalid operand for instruction
; ldp lr, [sp], #16
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .globl  _customFunction
.align  2
_customFunction:
// Save the link register to the stack
stp     lr, [sp, #-16]!

// Check if int1 is negative
cmp     w0, #0
blt     .1_neg_int1

// If positive or zero, directly move it to the location pointed by outInt
str     w0, [x2]
b       .2_next

.1_neg_int1:
// Negate int1 and store the result in the location pointed by outInt
neg     w0, w0
str     w0, [x2]

.2_next:
// Check if double2 is negative
fcmp    d1, #0.0
blt     .3_neg_double2

// If positive or zero, directly move it to the location pointed by outDouble
fstr    d1, [x3]
b       .4_end

.3_neg_double2:
// Negate double2 and store the result in the location pointed by outDouble
fneg    d1, d1
fstr    d1, [x3]

.4_end:
// Restore the link register and return
ldp     lr, [sp], #16
ret
