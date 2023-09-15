//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and other callee saved registers
stp     x29, x30, [sp, #-16]!  // Save FP and LR to stack
mov     x29, sp               // Set FP to current SP

// Check if int2 (x1) is less than 5
cmp     w1, #5                // Compare int2 with 5
blt     .less_than_five       // Branch if int2 is less than 5

// Else part
sub     w1, w1, #2            // int2 = int2 - 2

adr     x4, .fp_one           // Load address of floating point constant
ldr     d4, [x4]              // Load constant into d4
fsub    d1, d1, d4            // double2 = double2 - 1.0

bl      _customFunction       // Recursive call
ldp     x29, x30, [sp], #16   // Restore FP and LR from stack
ret

.less_than_five:
str     w0, [x2]              // *outInt = int1
fadd    d4, d0, d1            // d4 = double1 + double2
str     d4, [x3]              // *outDouble = d4
ldp     x29, x30, [sp], #16   // Restore FP and LR from stack
ret

// Floating point constant
.align 3
.fp_one:
.double 1.0
