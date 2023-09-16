//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align  2
_customFunction:
// Save the link register (lr) and other callee-saved registers we'll be using
stp x29, x30, [sp, -16]!
mov x29, sp  // Set up frame pointer

// Step 1: Store double1 into *outDouble
str d0, [x3]

// Step 2: Loop to subtract double2 from *outDouble for int1 times
// Initialize loop counter i in w4 (32-bit register)
mov w4, wzr  // w4 = i = 0

loop_start:
// Compare i with int1
cmp w4, w0  // Compare i with int1
b.ge loop_end  // If i >= int1, break out of loop

// *outDouble -= double2;
ldr d2, [x3]  // Load current value of *outDouble to d2
fsub d2, d2, d1  // Subtract double2 from the value
str d2, [x3]  // Store the result back to *outDouble

// i++
add w4, w4, #1
b loop_start

loop_end:
// Step 3: Store 0 into *outInt
mov w5, wzr  // w5 = 0
str w5, [x2]

// Restore link register and other callee-saved registers
ldp x29, x30, [sp], 16
ret
