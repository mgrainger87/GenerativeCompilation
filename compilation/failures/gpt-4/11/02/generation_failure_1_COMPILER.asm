; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzyisqg0o.asm:15:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzyisqg0o.asm:24:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction

_customFunction:
// Compare int1 and int2
cmp w0, w1

// If int1 > int2, jump to the true_label
b.gt true_label

// Else block
// Store int2 into *outInt
str w1, [x2]

// Store double2 into *outDouble
fstr d1, [x3]
ret

true_label:
// True block
// Store int1 into *outInt
str w0, [x2]

// Store double1 into *outDouble
fstr d0, [x3]
ret
