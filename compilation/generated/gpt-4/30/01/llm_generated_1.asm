//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save necessary registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = int2;
str w1, [x2]

// for(int i = 0; i < (int)double2; i++)
fcvtns w4, d1
mov w5, wzr
loop_start:
cmp w5, w4
b.ge loop_end

// *outInt -= int1;
ldr w6, [x2]
sub w6, w6, w0
str w6, [x2]

// Increment loop counter
add w5, w5, #1
b loop_start
loop_end:

// *outDouble = 0.0;
fmov d0, #0.0
str d0, [x3]

// Restore saved registers and return
ldp x29, x30, [sp], #16
ret
