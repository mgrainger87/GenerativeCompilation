//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and frame pointer
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = 0;
mov w4, #0
str w4, [x2]

// for(int i = int1; i <= int2; i++)
mov w5, w0   // w5 will be used as the loop counter i
.loop_start:
cmp w5, w1
bgt .loop_end
ldr w4, [x2]     // load current value of *outInt to w4
add w4, w4, w5   // w4 = w4 + w5
str w4, [x2]     // store updated value back to *outInt
add w5, w5, #1   // i++
b .loop_start

.loop_end:
// *outDouble = 0.0;
movz x4, #0
str d4, [x3]     // store double precision 0.0 to *outDouble

// Restore frame pointer and link register, then return
ldp x29, x30, [sp], #16
ret
