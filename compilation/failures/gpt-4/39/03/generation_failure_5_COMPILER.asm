; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpbyl_d0no-cb23cd.s:23:1: error: unknown AArch64 fixup kind!
; ldr x19, .double_const_addr
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.data
.double_const:
.double 10.0
.double 1.0
.double_const_addr:
.quad .double_const

.text
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp x29, lr, [sp, #-16]!

// Load the address of .double_const into x19
ldr x19, .double_const_addr

// Load the constants into floating-point registers
ldr d19, [x19]
ldr d20, [x19, #8]

// Check if double1 < 10
fcmp d0, d19
blt 1f

// If false, call customFunction(int1, int2+2, double1-1, double2+1, outInt, outDouble)
add w1, w1, #2
fsub d0, d0, d20
fadd d1, d1, d20
bl _customFunction

// Restore callee-saved registers and return
ldp x29, lr, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret

1: // If true, *outInt = int1 * int2
mul w19, w0, w1
str w19, [x2]

// *outDouble = double1
str d0, [x3]

// Restore callee-saved registers and return
ldp x29, lr, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
