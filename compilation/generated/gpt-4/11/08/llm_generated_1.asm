//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare int1 and int2
cmp w0, w1

// Branch to else block if int1 <= int2
ble .Lelse

// If block
// *outInt = int1;
str w0, [x2]

// *outDouble = double1;
str d0, [x3]

// End of function
ret

.Lelse:
// *outInt = int2;
str w1, [x2]

// *outDouble = double2;
str d1, [x3]

// End of function
ret
