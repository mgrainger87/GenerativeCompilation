//compiler_errors=6,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare int2 (x1) with 0
cmp x1, #0

// If int2 <= 0, jump to the 'assign_values' label
ble assign_values

// Else, prepare for a recursive call to customFunction

// Increment int1 (x0) and decrement int2 (x1)
add x0, x0, #1
add x1, x1, #-1

// Construct floating-point literal 1.0 using integer operations
mov x4, #0x3FF00000  // The bit pattern for double precision 1.0
movk x4, #0, lsl #16
fmov d2, x4

// Increment double2 (d1) using the constructed literal
fadd d1, d1, d2

// Save the link register to the stack (to preserve the return address)
stp x30, xzr, [sp, #-16]!

// Make the recursive call
bl _customFunction

// Restore the link register from the stack
ldp x30, xzr, [sp], #16

// Return
ret

// Label to assign values directly without recursion
assign_values:
// Store int1 (x0) to the address in outInt (x2)
str w0, [x2]

// Store double1 (d0) to the address in outDouble (x3)
str d0, [x3]

// Return
ret
