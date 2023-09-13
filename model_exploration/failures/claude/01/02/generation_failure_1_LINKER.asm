;Compiler error: None
;Linker error: Undefined symbols for architecture arm64:
;  "_customFunction", referenced from:
;      _main in tmppv7hwz25.o
;ld: symbol(s) not found for architecture arm64
;clang: error: linker command failed with exit code 1 (use -v to see invocation)
;
;Excecution error: None
;Correctness error: None
.text
.align 2
.global customFunction
customFunction:
// x0 contains int1
// x1 contains int2

// d0 contains double1
// d1 contains double2
// x2 contains address of _outInt
// x3 contains address of _outDouble
str w0, [x2]       // store int1 to _outInt
fmov d0, d0        // move double1 to return register
ret
