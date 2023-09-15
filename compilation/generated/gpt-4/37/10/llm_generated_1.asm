//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 4
_customFunction:
// Check if int1 (x0) is less than 5
cmp w0, #5
blt .Lif_less_than_5

// Else branch: recursive call
// int1-2
sub x0, x0, #2
// double1+1: Use an intermediary register (d8)
fmov d8, #1.0
fadd d0, d0, d8
bl _customFunction
ret

.Lif_less_than_5:
// int1 + int2
add w4, w0, w1
// Store the result to *outInt
str w4, [x2]

// Store double2 to *outDouble
str d1, [x3]

ret
