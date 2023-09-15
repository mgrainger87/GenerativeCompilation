//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align  3
_customFunction:
// Save the link register to preserve return address
stp     x30, x20, [sp, #-16]!

// Check if int1 (x0) <= 0
cmp     w0, #0
ble     .Lstore_values

// Else part: Recursive function call
// Decrement int1, Increment int2
sub     w0, w0, #1
add     w1, w1, #1

// Load constant 1.0 into d2
mov     x4, 0x3ff0000000000000   // Bit representation of 1.0
fmov    d2, x4

// Increment double1 using d2
fadd    d0, d0, d2

// Recursive call to customFunction
bl      _customFunction

// Restore the link register and return
ldp     x30, x20, [sp], #16
ret

.Lstore_values:
// Store int2 to *outInt
str     w1, [x2]

// Store double2 to *outDouble
str     d1, [x3]

// Restore the link register and return
ldp     x30, x20, [sp], #16
ret
