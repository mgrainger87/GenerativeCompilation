//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2

_customFunction:
// Compare double1 (d0) with 0.0
fmov    d8, #0.0            // Load 0.0 into temporary register d8
fcmp    d0, d8              // Compare d0 (double1) with 0.0
beq     .1zero              // If equal, branch to label .1zero

// Else part: *outInt = int1 - int2 and *outDouble = double1
sub     w4, w0, w1          // w4 = int1 - int2
str     w4, [x2]            // Store w4 to address in x2 (*outInt)
fmov    d9, d0              // Move double1 to d9
str     d9, [x3]            // Store d9 to address in x3 (*outDouble)
ret

.1zero:
// If part: *outInt = int1 + int2 and *outDouble = 1.0
add     w4, w0, w1          // w4 = int1 + int2
str     w4, [x2]            // Store w4 to address in x2 (*outInt)
fmov    d9, #1.0            // Load 1.0 into d9
str     d9, [x3]            // Store d9 to address in x3 (*outDouble)
ret
