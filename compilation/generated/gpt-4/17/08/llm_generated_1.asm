//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Store callee-saved registers and link register
stp x29, x30, [sp, -16]!  // Push x29 (frame pointer) and x30 (link register) onto the stack
mov x29, sp               // Set up frame pointer for this function

// Check if int2 (x1) is less than 0
cmp w1, #0
bge .int_not_less_than_zero

1:  // If int2 is less than 0, store int1 in *outInt
str w0, [x2]
b .continue_double

.int_not_less_than_zero:
// Otherwise, store int2 in *outInt
str w1, [x2]

.continue_double:
// Compare double1 and double2
fcmp d0, d1
bgt .double1_greater

2:  // If double2 is greater or equal, store double2 in *outDouble
str d1, [x3]
b .end_function

.double1_greater:
// Otherwise, store double1 in *outDouble
str d0, [x3]

.end_function:
// Restore callee-saved registers and link register
ldp x29, x30, [sp], #16
ret
