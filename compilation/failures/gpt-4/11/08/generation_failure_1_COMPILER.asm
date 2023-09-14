; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf6k910qg.asm:14:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d0, [x3]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf6k910qg.asm:24:1: error: unrecognized instruction mnemonic, did you mean: stlr, str, strb, strh, sttr, stur, stxr?
; fstr d1, [x3]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Compare int1 and int2
cmp w0, w1

// Branch to else block if int1 <= int2
ble .Lelse

// If block
// *outInt = int1;
str w0, [x2]

// *outDouble = double1;
fstr d0, [x3]

// End of function
ret

.Lelse:
// *outInt = int2;
str w1, [x2]

// *outDouble = double2;
fstr d1, [x3]

// End of function
ret
