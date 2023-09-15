//compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Save the link register, and callee-saved registers if needed.
stp x29, x30, [sp, #-16]!
mov x29, sp

// Compare double1 and double2
fcmp d0, d1

// If they are equal, execute the following block
beq .1_equal

// Load immediate floating point value 0.1 into a general-purpose register and then to a floating-point register
movz x4, #0x9999, lsl #48  // Uppermost 16 bits
movk x4, #0x3FB9, lsl #16  // Middle 16 bits
fmov d4, x4

// Modify int2, double1, and double2
add w1, w1, #1
fsub d0, d0, d4
fadd d1, d1, d4

// Call customFunction recursively
bl _customFunction

// Restore the link register and return
ldp x29, x30, [sp], #16
ret

.1_equal:
// Store int2 to *outInt
str w1, [x2]

// Store double2 to *outDouble
str d1, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
