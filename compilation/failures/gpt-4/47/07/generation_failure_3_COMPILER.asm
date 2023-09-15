; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=1
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpabjvyv5x.asm:16:9: error: invalid operand for instruction
; mov d0, d1
;         ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _helperFunction
_helperFunction:
fneg    d0, d0
ret

.global _customFunction
_customFunction:
// Save the link register (lr) and frame pointer (x29)
stp     x29, x30, [sp, #-16]!
mov     x29, sp

// *outInt = int1;
str     w0, [x2]

// Move double2 value to d0
mov     d0, d1

// Call helperFunction(double2);
bl      _helperFunction

// *outDouble = helperFunction(double2);
str     d0, [x3]

// Restore lr and frame pointer
ldp     x29, x30, [sp], #16

ret
