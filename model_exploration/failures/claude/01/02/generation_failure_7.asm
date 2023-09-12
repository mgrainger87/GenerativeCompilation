;Compiler error: None
;Linker error: duplicate symbol '_main' in:
;    /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp13qhg611.o
;    /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmppv7hwz25.o
;ld: 1 duplicate symbol for architecture arm64
;clang: error: linker command failed with exit code 1 (use -v to see invocation)
;
;Execution error: None
;Correctness error: None.text
.align 2
.global _main
_main:
// set up parameters
mov x0, #10
mov x1, #20
fmov d0, #1.5
fmov d1, #2.5
mov x2, #0
mov x3, #0

bl _customFunction

// other code
.align 2
.global _customFunction
_customFunction:
str w0, [x2]
fmov d0, d0
ret
