; compiler_errors=7,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:1:1: error: unknown directive
; .intel_syntax noprefix
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:3:20: error: unexpected token in argument list
; void customFunction(int int1, int int2) {
;                    ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:4:5: error: invalid token in expression
; int *int2Ptr = &int2;
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:4:5: error: invalid operand
; int *int2Ptr = &int2;
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:5:12: error: unexpected token in argument list
; int result = *int2Ptr;
;            ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:6:1: error: unrecognized instruction mnemonic
; return;
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjvjcw9id.asm:7:1: error: unrecognized instruction mnemonic, did you mean: b?
; }
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .intel_syntax noprefix

void customFunction(int int1, int int2) {
int *int2Ptr = &int2;
int result = *int2Ptr;
return;
}
