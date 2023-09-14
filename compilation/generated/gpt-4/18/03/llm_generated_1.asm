//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.global _customFunction
_customFunction:
// Save caller-saved registers and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 (in W0) is greater than 10
cmp w0, #10
ble .Lless_than_or_equal_to_10

// Multiply int1 and int2 (result in W0)
mul w0, w0, w1
b .Lassign_int

.Lless_than_or_equal_to_10:
// Add int1 and int2 (result in W0)
add w0, w0, w1

.Lassign_int:
// Assign result to *outInt
str w0, [x2]

// Load 5.0 into D2 and compare with double2 (in D1)
fmov d2, #5.0
fcmp d1, d2
fcsel d0, d0, d1, lt  // Corrected the condition here to 'lt'

// Assign result to *outDouble
str d0, [x3]

// Restore caller-saved registers and link register
ldp x29, x30, [sp], #16
ret
