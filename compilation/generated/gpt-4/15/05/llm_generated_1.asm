//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Save callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x29, x30, [sp, #-16]!
add x29, sp, #0      // Set up the frame pointer

// Check if double1 (d0) is equal to 0.0
fcmp d0, #0.0

// If double1 is 0, jump to .Lzero
beq .Lzero

// Else, do the else part
sub w20, w0, w1      // int1 - int2
str w20, [x2]       // Store result in *outInt
fmov d22, d0        // Move double1 to d22
str d22, [x3]       // Store double1 in *outDouble
b .Lend

.Lzero:
// If double1 is 0.0
add w21, w0, w1     // int1 + int2
str w21, [x2]       // Store result in *outInt
fmov d22, #1.0      // Load 1.0 into d22
str d22, [x3]       // Store 1.0 in *outDouble

.Lend:
// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
