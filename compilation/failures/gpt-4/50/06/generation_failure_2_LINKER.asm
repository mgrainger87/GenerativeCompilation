; compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: helperFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp6vnb3on7.o
; ld: warning: arm64 function not 4-byte aligned: customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp6vnb3on7.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in tmp2ue8obpb.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
.global helperFunction
helperFunction:
add x0, x0, #10     // a = a + 10
ret
.global customFunction
customFunction:
// Save the link register since we're making a function call
stp x30, x19, [sp, #-16]!

// Call helperFunction with int1
bl helperFunction

// Store the result in *outInt
str w0, [x2]

// Store double2 in *outDouble
str d1, [x3]

// Restore the saved registers
ldp x30, x19, [sp], #16

ret
