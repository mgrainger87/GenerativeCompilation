; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpg0l1y0qv.asm:17:10: error: invalid operand for instruction
; ldr d0, [double1]
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpg0l1y0qv.asm:18:10: error: invalid operand for instruction
; ldr d1, [double2]
;          ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpg0l1y0qv.asm:21:11: error: invalid operand for instruction
; str w19, [outInt]
;           ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpg0l1y0qv.asm:24:1: error: unrecognized instruction mnemonic
; stfs d0, [outDouble]
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpg0l1y0qv.asm:27:1: error: unrecognized instruction mnemonic
; stfs d1, [outDouble2]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .text
.global customFunction

customFunction:
// Mangle function name according to Clang conventions for C (not C++).
// Mark symbol as global where necessary.
// Align symbols appropriately for arm64.
stp x29, x30, [sp, -16]!
mov x29, sp

// Save callee-saved registers.
str x19, [sp, 16]

// Load parameters into registers.
mov x19, int1
mov x20, int2
ldr d0, [double1]
ldr d1, [double2]

// Store the value of int1 in outInt.
str w19, [outInt]

// Store the value of double1 in outDouble.
stfs d0, [outDouble]

// Store the value of double2 in outDouble2.
stfs d1, [outDouble2]

// Restore callee-saved registers.
ldr x19, [sp, 16]

// Pop the stack frame.
ldp x29, x30, [sp], 16
ret
