; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _helperFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpude5cyvp.o
; ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpude5cyvp.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in test_driver.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
_helperFunction:                     ; mangled function name
add w0, w0, w1                   ; w0 = w0 + w1
ret                              ; return
_customFunction:
stp x29, x30, [sp, #-16]!        ; save frame pointer and link register (callee-saved)
mov x29, sp                      ; set frame pointer

bl _helperFunction               ; call helperFunction
str w0, [x2]                     ; store result in *outInt

fadd d0, d0, d1                  ; d0 = d0 + d1
str d0, [x3]                     ; store result in *outDouble

ldp x29, x30, [sp], #16          ; restore frame pointer and link register
ret                              ; return
