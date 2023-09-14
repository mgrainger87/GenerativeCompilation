//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save necessary registers
stp x29, x30, [sp, -16]! // Save frame pointer and link register
mov x29, sp             // Update frame pointer

// Compare int1 and int2
cmp w0, w1

// If int1 > int2, store int1 and double1 to the output pointers
b.le .store_second_values

str w0, [x2]    // Store int1 to *outInt
str d0, [x3]    // Store double1 to *outDouble
b .end_function

.store_second_values:
// Store int2 and double2 to the output pointers
str w1, [x2]    // Store int2 to *outInt
str d1, [x3]    // Store double2 to *outDouble

.end_function:
// Restore saved registers and return
ldp x29, x30, [sp], 16
ret
