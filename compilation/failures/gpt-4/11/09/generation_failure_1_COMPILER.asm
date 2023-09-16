; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpq072b685.asm:15:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpq072b685.asm:20:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save caller-saved registers and link register (x30)
stp x29, x30, [sp, #-16]! // push x29 (frame pointer) and x30 (link register) onto stack
mov x29, sp               // set frame pointer

// Compare int1 and int2
cmp w0, w1

// If int1 > int2, branch to the true block
b.gt .true_block

// False block: int1 <= int2
str w1, [x2]             // store int2 to *outInt
fstr d1, [x3]            // store double2 to *outDouble
b .end

.true_block:
str w0, [x2]             // store int1 to *outInt
fstr d0, [x3]            // store double1 to *outDouble

.end:
// Restore registers and return
ldp x29, x30, [sp], #16  // pop x29 and x30 from stack
ret
