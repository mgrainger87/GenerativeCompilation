; compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmp2wp2w0gf.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .text
.align 2
.global customFunction
customFunction:
// x0 = int1
// x1 = int2
// d0 = double1
// d1 = double2
// x2 = _outInt
// x3 = _outDouble

stp x29, x30, [sp,#-16]!
mov x29, sp

str w0, [x2]   // store int1 to _outInt
fmov d0, d0    // store double1 to _outDouble

ldp x29, x30, [sp], #16
ret
