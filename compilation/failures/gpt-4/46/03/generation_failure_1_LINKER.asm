; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: Undefined symbols for architecture arm64:
;   "_helperFunction", referenced from:
;       _customFunction in tmpqjc8ps6s.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .section    __TEXT,__text,regular,pure_instructions
.globl  _customFunction
.p2align    3
_customFunction:
// Save link register (lr) to stack since we're making a function call
stp     lr, x30, [sp, #-16]!

// Call helperFunction with int1 (x0) and int2 (x1)
bl      _helperFunction

// Load the result of helperFunction (x0) to *outInt (x2)
str     w0, [x2]

// Load double2 (d1) to *outDouble (x3)
str     d1, [x3]

// Restore link register (lr) from stack
ldp     lr, x30, [sp], #16

// Return to caller
ret
