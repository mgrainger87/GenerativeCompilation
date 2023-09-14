//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3

_customFunction:
// Store callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp x29, x30, [sp, #-16]!
add x29, sp, #0

// *outInt = int1;
str w0, [x2]

// Convert double1 to integer
fcvtzs w24, d0

// for(int i = 0; i < (int)double1; i++) {
mov w23, #0       // Use w23 as the loop counter
1:
cmp w23, w24
b.ge 2f

// *outInt += int2;
ldr w25, [x2]
add w25, w25, w1
str w25, [x2]

add w23, w23, #1
b 1b

2:
// *outDouble = 0.0;
mov x22, #0
str x22, [x3]

// Restore callee-saved registers
ldp x29, x30, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
