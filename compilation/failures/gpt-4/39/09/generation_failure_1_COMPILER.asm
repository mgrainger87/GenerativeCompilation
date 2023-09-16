; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0asjkxfv.asm:29:15: error: unexpected floating point literal
; fsub d6, d0, #1.0
;               ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0asjkxfv.asm:30:15: error: unexpected floating point literal
; fadd d7, d1, #1.0
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save link register and other caller-saved registers that will be used
stp x30, x19, [sp, #-16]!
stp x20, x21, [sp, #-16]!
stp d7, d6, [sp, #-16]!

// Check if double1 (d0) < 10
fmov d6, #10.0
fcmp d0, d6

// If double1 is >= 10, jump to the else part
b.ge .Lelse

.Lif:
// *outInt = int1 * int2
mul w20, w0, w1
str w20, [x2]

// *outDouble = double1
fmov d7, d0
str d7, [x3]

b .Lend

.Lelse:
// Prepare arguments for recursive call
add w21, w1, #2
fsub d6, d0, #1.0
fadd d7, d1, #1.0

// Call customFunction recursively
mov w0, w0
mov w1, w21
fmov d0, d6
fmov d1, d7
bl _customFunction

.Lend:
// Restore saved registers and return
ldp d7, d6, [sp], #16
ldp x20, x21, [sp], #16
ldp x30, x19, [sp], #16
ret
