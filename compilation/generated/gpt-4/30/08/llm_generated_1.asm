//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: save the frame and link registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Store the value of int2 (x1) into the address pointed by outInt (x2)
str w1, [x2]

// Initialize loop counter i with 0
mov w4, #0

1:  // Check loop condition: i < (int)double2
fcvtzs w5, d1 // Convert double2 to integer
cmp w4, w5
b.ge 2f

// Loop body: *outInt -= int1
ldr w6, [x2] // Load value at outInt to w6
sub w6, w6, w0 // Subtract int1
str w6, [x2] // Store the result back to outInt

// Increment loop counter
add w4, w4, #1
b 1b // Branch back to loop check

2:  // End of loop

// Store 0.0 into outDouble
fmov d7, #0.0 // Load 0.0 into d7
str d7, [x3]

// Epilogue: restore the frame and link registers and return
ldp x29, x30, [sp], #16
ret
