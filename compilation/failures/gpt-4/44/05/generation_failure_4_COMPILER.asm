; compiler_errors=4,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpurwrdpwt.asm:19:10: error: invalid operand for instruction
; fsub v2, v0, v1
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
// Name mangling for helperFunction
_helperFunction:
// Multiply a with itself
mul x0, x0, x0
// Return the result
ret

// Name mangling for customFunction
_customFunction:
// Save link register and other caller-saved registers
stp x30, x19, [sp, #-16]!

// Call helperFunction with int1 (in x0)
bl _helperFunction
// Store the result to *outInt (x2 points to outInt)
str w0, [x2]

// Subtract double2 from double1 into v2
fsub v2, v0, v1
// Store the result from v2 to *outDouble (x3 points to outDouble)
str d2, [x3]

// Restore saved registers and return
ldp x30, x19, [sp], #16
ret
