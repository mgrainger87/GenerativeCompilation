; compiler_errors=2,linker_errors=1,execution_errors=0,correctness_errors=0
; ; Compiler error: None
; ; Linker error: ld: warning: arm64 function not 4-byte aligned: customFunction from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf8zj8jt4.o
; ld: warning: arm64 function not 4-byte aligned: .1_equal from /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpf8zj8jt4.o
; Undefined symbols for architecture arm64:
;   "_customFunction", referenced from:
;       _main in test_driver.o
; ld: symbol(s) not found for architecture arm64
; clang: error: linker command failed with exit code 1 (use -v to see invocation)
; 
; ; Execution error: None
; ; Correctness error: None
; .global customFunction
customFunction:
// Save link register and any callee-saved registers (none in this case)
stp     lr, x30, [sp, #-16]!  // save lr to stack (for recursive call)

// Compare double1 and double2
fcmp    d0, d1

// Branch if equal
beq     .1_equal

// Recursive call case:
// int2+1
add     w1, w1, #1
// Load 0.1 into d4
movz    x4, #0x9999, lsl #16 // middle 32 bits of the double representation for 0.1
movk    x4, #0x3FF9, lsl #48 // upper 16 bits
movk    x4, #0x999A          // lower 16 bits
fmov    d4, x4
// double1-0.1
fsub    d0, d0, d4
// double2+0.1
fadd    d1, d1, d4
// Recursive call
bl      customFunction
// Restore link register and return
ldp     lr, x30, [sp], #16
ret

.1_equal:
// *outInt = int2
str     w1, [x2]
// *outDouble = double2
str     d1, [x3]
// Restore link register and return
ldp     lr, x30, [sp], #16
ret
