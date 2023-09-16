; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpcb379p88.asm:12:9: error: invalid operand for instruction
; mov d0, d1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _helperFunction
_helperFunction:
fneg d0, d0      // Negate the value of d0 and store the result back in d0
ret              // Return with the result in d0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!    // Store frame pointer and link register to the stack (prolog)
mov x29, sp                  // Set frame pointer

str w0, [x2]                 // Store the value of w0 (int1) to the memory address pointed to by x2 (outInt)

mov d0, d1                   // Move value from d1 (double2) to d0
bl _helperFunction           // Call helperFunction
str d0, [x3]                 // Store the returned value (negative of double2) to the memory address pointed to by x3 (outDouble)

ldp x29, x30, [sp], #16      // Restore frame pointer and link register (epilog)
ret
