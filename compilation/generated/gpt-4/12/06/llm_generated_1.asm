//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register (return address) to stack.
stp x30, xzr, [sp, #-16]!

// Compare double1 and double2.
fcmp d0, d1

// Jump to else_block if double1 <= double2.
ble else_block

// If double1 > double2, execute this block.
// *outInt = int1 + int2;
add w4, w0, w1
str w4, [x2]

// *outDouble = double1;
fmov d2, d0
str d2, [x3]

// Pop link register from stack and return.
ldp x30, xzr, [sp], #16
ret

else_block:
// *outInt = int1 - int2;
sub w4, w0, w1
str w4, [x2]

// *outDouble = double2;
fmov d2, d1
str d2, [x3]

// Pop link register from stack and return.
ldp x30, xzr, [sp], #16
ret
