//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 3
_customFunction:
// Save link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check if int1 (in w0) is less than 0
cmp w0, #0
b.ge 1f

// If int1 is less than 0, negate it
neg w0, w0

1:  // Store absolute value of int1 to *outInt (address in x2)
str w0, [x2]

// Check if double2 (in d1) is less than 0.0
fmov d2, #0.0
fcmp d1, d2
b.ge 2f

// If double2 is less than 0.0, negate it
fneg d1, d1

2:  // Store absolute value of double2 to *outDouble (address in x3)
str d1, [x3]

// Restore link register and return
ldp x29, x30, [sp], #16
ret
