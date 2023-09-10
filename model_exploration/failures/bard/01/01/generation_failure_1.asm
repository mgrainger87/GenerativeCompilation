.text
.align 4
.global customFunction
customFunction:
// Save the caller-saved registers
mov x19, x0
mov x20, x1
mov x21, x2
mov x22, x3

// Load the arguments into registers
mov x0, int1
mov x1, int2
mov x2, double1
mov x3, double2

// Store the output values
str x0, [outInt]
fstp d0, [outDouble]

// Restore the caller-saved registers
mov x0, x19
mov x1, x20
mov x2, x21
mov x3, x22

// Return
ret
