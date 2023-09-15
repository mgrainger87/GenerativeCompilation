//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp     lr, x29, [sp, #-16]!

// Compare int1 and int2
cmp     w0, w1

// If not equal, jump to else block
b.ne    .Lelse

// *outInt = int1 * int2
mul     w5, w0, w1  // using w5 instead of x30
str     w5, [x2]

// Load immediate floating point values into floating-point register
fadd    d5, d0, d1  // using d5 instead of d4
str     d5, [x3]
b       .Lend

.Lelse:
// *outInt = 0
mov     w5, #0     // using w5 instead of x30
str     w5, [x2]

// *outDouble = 0.0
fmov    d5, #0.0   // using d5 instead of d4
str     d5, [x3]

.Lend:
// Restore the link register
ldp     lr, x29, [sp], #16
ret
