//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Compare int1 (x0) with 5
cmp w0, #5
blt .Lless_than_5

// If not less than 5, prepare arguments for recursive call

// int1-2 -> x0 = x0 - 2
sub x0, x0, #2

// double1+1 -> d0 = d0 + 1
// Load 1.0 into a floating-point register (d2)
fmov d2, #1.0
fadd d0, d0, d2

// call customFunction recursively
bl _customFunction
ret

.Lless_than_5:
// *outInt = int1 + int2 -> *x2 = x0 + x1
add w4, w0, w1
str w4, [x2]

// *outDouble = double2 -> *x3 = d1
str d1, [x3]

ret
