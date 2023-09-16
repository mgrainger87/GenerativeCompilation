; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _helperFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjdm0d2t6.o
; ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjdm0d2t6.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmp6fr5jfld.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; Function: _helperFunction
_helperFunction:
; Add 10 to the input integer
add x0, x0, #10
; Return the result in x0
ret
; Function: _customFunction
_customFunction:
; Save the link register
stp x30, x29, [sp, #-16]!  ; Use the frame pointer (x29) for good measure
mov x29, sp

; Call helperFunction with the first integer parameter
bl _helperFunction

; Store the result at the address given by the outInt pointer
str x0, [x2]

; Store double2 directly to the address provided by the outDouble pointer
str d1, [x3]

; Restore the link register and frame pointer
ldp x30, x29, [sp], #16

; Return
ret
