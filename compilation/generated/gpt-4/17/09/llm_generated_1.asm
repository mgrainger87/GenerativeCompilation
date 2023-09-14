//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Function prologue
stp x29, x30, [sp, #-16]! // save frame pointer and link register
mov x29, sp // set frame pointer to the current stack pointer

// Compare int2 with 0
cmp w1, #0 // compare int2 (x1) with 0
b.lt .int1_greater_than_0 // branch if int2 < 0

// int2 >= 0
str w1, [x2] // store int2 in *outInt
b .compare_doubles

.int1_greater_than_0:
str w0, [x2] // store int1 in *outInt

.compare_doubles:
// Compare double1 with double2
fcmp d0, d1 // compare double1 (v0) with double2 (v1)
b.le .double2_greater // branch if double1 <= double2

// double1 > double2
str d0, [x3] // store double1 in *outDouble
b .function_end

.double2_greater:
str d1, [x3] // store double2 in *outDouble

.function_end:
// Function epilogue
ldp x29, x30, [sp], #16 // restore frame pointer and link register
ret
