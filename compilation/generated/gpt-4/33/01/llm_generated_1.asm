//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if double1 (d0) is <= 0
fcmp d0, #0.0
ble 1f

// Load the immediate floating point values
adr x19, 3f
ldr d4, [x19]
ldr d5, [x19, #8]

fsub d0, d0, d4
fadd d1, d1, d5

bl _customFunction

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret

1:
add w4, w0, w1
str w4, [x2]
str d1, [x3]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret

3:
.double -0.5, 0.5
