;Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpjkrm6s6z.asm:17:10: error: expected compatible register or floating-point constant
;fmov d4, [x3]
;         ^
;
;Linker error: None
;Execution error: None
;Correctness error: None
.text
.align 2
.global _main
_main:
// set up test values
mov x0, #10 // int1 = 10
mov x1, #20 // int2 = 20
fmov d0, #1.5 // double1 = 1.5
fmov d1, #2.5 // double2 = 2.5
mov x2, #0 // _outInt = 0
mov x3, #0 // _outDouble = 0

bl customFunction

// verify results
ldr w4, [x2] // load _outInt
fmov d4, [x3] // load _outDouble
// other code for main
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
