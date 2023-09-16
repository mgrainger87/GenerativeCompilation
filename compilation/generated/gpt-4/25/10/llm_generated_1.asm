//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store callee saved registers and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outDouble = double1;
str d0, [x3]

// For loop
cbz x0, .Lend_for // If int1 (x0) is 0, skip the loop
.Lloop_start:
fsub d0, d0, d1 // d0 = d0 - d1
str d0, [x3]    // *outDouble = d0

sub x0, x0, #1  // i = i - 1
cbnz x0, .Lloop_start // If x0 is not 0, repeat loop

.Lend_for:
// *outInt = 0;
mov w4, #0      // Load immediate value 0 into w4
str w4, [x2]    // *outInt = w4

// Restore callee saved registers and return
ldp x29, x30, [sp], #16
ret
