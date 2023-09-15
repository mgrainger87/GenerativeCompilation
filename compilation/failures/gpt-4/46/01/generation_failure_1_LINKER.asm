; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpdysml9ti.o
; Undefined symbols for architecture arm64:
;   "_helperFunction", referenced from:
;       _customFunction in tmpdysml9ti.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
; Save the link register (x30)
stp x30, xzr, [sp, #-16]!

; Call helperFunction to calculate *outInt
bl _helperFunction

; Store the result in *outInt
str w0, [x2]

; Store double2 in *outDouble
fmov d0, d1
str d0, [x3]

; Restore the link register (x30) and return
ldp x30, xzr, [sp], #16
ret
