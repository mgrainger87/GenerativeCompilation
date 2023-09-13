; compiler_errors=6,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8709amir.asm:1:20: error: unexpected token in argument list
; void customFunction(int int1, int int2) {
;                    ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8709amir.asm:2:5: error: invalid token in expression
; int *int2Ptr = &int2;
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8709amir.asm:2:5: error: invalid operand
; int *int2Ptr = &int2;
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8709amir.asm:3:12: error: unexpected token in argument list
; int result = *int2Ptr;
;            ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8709amir.asm:4:1: error: unrecognized instruction mnemonic
; return;
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp8709amir.asm:5:1: error: unrecognized instruction mnemonic, did you mean: b?
; }
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; void customFunction(int int1, int int2) {
int *int2Ptr = &int2;
int result = *int2Ptr;
return;
}
