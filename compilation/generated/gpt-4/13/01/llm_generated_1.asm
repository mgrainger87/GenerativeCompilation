//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save link register and any other necessary registers
stp x30, x19, [sp, #-16]!   // Store link register and x19 on the stack (we'll use x19 as a temp register)

// Check if int1 (x0) is equal to int2 (x1)
cmp w0, w1
b.ne _1_not_equal

// If they are equal:
// *outInt = int1 * int2
mul w19, w0, w1
str w19, [x2]

// Load double1 + double2 into a register and then store it in *outDouble
fadd d19, d0, d1
str d19, [x3]
b _1_end

_1_not_equal:
// If they are not equal:
// *outInt = 0
mov w19, #0
str w19, [x2]

// *outDouble = 0.0
fmov d19, #0.0
str d19, [x3]

_1_end:
// Restore registers and return
ldp x30, x19, [sp], #16
ret
