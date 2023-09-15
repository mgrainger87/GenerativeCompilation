//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and other callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 (w0) is less than 5
cmp w0, #5
bge .Lelse

.Lthen:
// int1 + int2
add w4, w0, w1

// Store the result in *outInt (pointed to by x2)
str w4, [x2]

// Store double2 (d1) in *outDouble (pointed to by x3)
str d1, [x3]

// Restore registers and return
ldp x29, x30, [sp], #16
ret

.Lelse:
// int1-2 -> w0 = w0 - 2
sub w0, w0, #2

// double1+1 -> d0 = d0 + 1.0
// Load immediate floating point value 1.0 into a register
fmov d4, #1.0
fadd d0, d0, d4

// Call the function recursively
bl _customFunction

// Restore registers and return
ldp x29, x30, [sp], #16
ret
