//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare int1 and int2
cmp w0, w1

// Branch to else block if int1 is not greater than int2
ble 1f

// int1 > int2
str w0, [x2]           // Store int1 to *outInt
fmov d2, d0            // Move double1 to d2 (temporary floating point register)
str d2, [x3]           // Store double1 to *outDouble
ret

1:  // Else block
str w1, [x2]           // Store int2 to *outInt
fmov d2, d1            // Move double2 to d2
str d2, [x3]           // Store double2 to *outDouble
ret
