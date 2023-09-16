; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpozcpyvi4.asm:14:9: error: invalid operand for instruction
; mov d0, d1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
_helperFunction:
fneg    d0, d0        // negate the value of d0 (a)
ret                  // return with result in d0
.global _customFunction
_customFunction:
// Save link register
stp     lr, x30, [sp, #-16]!

// *outInt = int1;
str     w0, [x2]

// Call helperFunction with double2
mov     d0, d1
bl      _helperFunction

// *outDouble = -double2; (result of helperFunction in d0)
str     d0, [x3]

// Restore link register and return
ldp     lr, x30, [sp], #16
ret
