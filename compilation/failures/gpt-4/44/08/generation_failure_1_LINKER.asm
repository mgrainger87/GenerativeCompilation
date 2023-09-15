; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _helperFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpu8puze7v.o
; ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpu8puze7v.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in test_driver.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; ; Function Name Mangling for C:
_helperFunction:
; Multiply x0 with itself and store result in x0
mul w0, w0, w0

; Return
ret
; Function Name Mangling for C:
_customFunction:
; Save link register to keep return address
stp x30, x29, [sp, #-16]!
mov x29, sp

; Call helperFunction to compute int1 * int1
bl _helperFunction

; Store result to *outInt
str w0, [x2]

; Subtract d1 from d0 (double1 - double2)
fsub d0, d0, d1

; Store result to *outDouble
str d0, [x3]

; Restore link register
ldp x30, x29, [sp], #16

; Return
ret
