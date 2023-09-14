//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and any other necessary registers
stp x30, xzr, [sp, #-16]!

// Compare int1 and int2
cmp w0, w1

// If int1 <= int2, branch to the else part
ble 1f

// int1 > int2, so we store int1 and double1
str w0, [x2]       // *outInt = int1;
fmov d2, d0        // Load double1 into d2 (temporary floating point register)
str d2, [x3]       // *outDouble = double1;
b 2f               // Jump to function end

1:  // Else part
str w1, [x2]       // *outInt = int2;
fmov d2, d1        // Load double2 into d2 (temporary floating point register)
str d2, [x3]       // *outDouble = double2;

2:  // Function end
ldp x30, xzr, [sp], #16  // Restore link register
ret
