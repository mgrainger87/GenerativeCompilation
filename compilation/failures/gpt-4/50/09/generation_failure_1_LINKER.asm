; compiler_errors=0,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: _customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp7k4yuo1r.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmp6smwb4x_.o
;   "_helperFunction", referenced from:
;       _customFunction in tmp7k4yuo1r.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; _customFunction:
// Store the link register x30 to the stack to save the return address
// And store x19 which we will use later
stp     x30, x19, [sp, #-16]!

// Call helperFunction with int1 as argument
mov     x0, x0  // Move int1 to x0
bl      _helperFunction

// Store the result of helperFunction (*outInt) in the memory location pointed by x2
str     w0, [x2]

// Store double2 in the memory location pointed by x3
str     d1, [x3]

// Restore the link register x30 and x19 from the stack
ldp     x30, x19, [sp], #16

// Return
ret
