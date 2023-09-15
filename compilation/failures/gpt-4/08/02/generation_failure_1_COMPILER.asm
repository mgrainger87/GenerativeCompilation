; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp6k385_bs.asm:3:10: error: invalid operand for instruction
; stp x30, [sp, #-16]!
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp6k385_bs.asm:8:10: error: invalid operand for instruction
; ldp x30, [sp], #16
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
stp x30, [sp, #-16]!      // Save the link register to the stack
mul w4, w0, w0            // Multiply int1 with itself and store the result in w4
str w4, [x2]              // Store the result to the location pointed by outInt
fmul d2, d1, d1           // Multiply double2 with itself and store the result in d2
str d2, [x3]              // Store the result to the location pointed by outDouble
ldp x30, [sp], #16        // Restore the link register from the stack
ret                       // Return from the function
