//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register to stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Calculate int1 + int2
add w4, w0, w1

// Compare (int1 + int2) to 100
cmp w4, #100
bls 1f  // If (int1 + int2) <= 100, jump to else block

// If block: *outInt = 100;
mov w5, #100
str w5, [x2]

// *outDouble = double1 * double2;
fmul d3, d0, d1
str d3, [x3]
b 2f

1:  // Else block: *outInt = int1 + int2;
str w4, [x2]

// *outDouble = double1 + double2;
fadd d3, d0, d1
str d3, [x3]

2:  // End of function
// Restore link register and return
ldp x30, x29, [sp], #16
ret
