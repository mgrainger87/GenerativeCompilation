; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpbblm_6be.asm:25:15: error: unexpected floating point literal
; fsub d5, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
.align 2
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register to the stack
mov x29, sp                // Set the frame pointer to the current stack pointer

// Check if int2 (x1) < 5
cmp w1, #5
b.ge .Lelse

// If branch
// *outInt = int1
str w0, [x2]

// *outDouble = double1 + double2
fadd d4, d0, d1
str d4, [x3]

b .Lend

.Lelse:
// Else branch: customFunction(int1, int2-2, double1, double2-1, outInt, outDouble)
sub w4, w1, #2
fsub d5, d1, #1.0
bl _customFunction

.Lend:
// Epilogue
ldp x29, x30, [sp], #16   // Restore frame pointer and link register from the stack
ret
