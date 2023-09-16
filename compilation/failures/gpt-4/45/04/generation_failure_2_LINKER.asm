; compiler_errors=0,linker_errors=1,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _helperFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp11eyajzb.o
; ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp11eyajzb.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in test_driver.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
_helperFunction:
fdiv    d0, d0, d1      ; d0 = a / b
ret
_customFunction:
; Save link register to stack
stp     x30, x29, [sp, #-16]!

; Store int2 to *outInt
str     w1, [x2]

; Call helperFunction
bl      _helperFunction

; Restore link register from stack
ldp     x30, x29, [sp], #16

; Store the result to *outDouble
str     d0, [x3]

ret
