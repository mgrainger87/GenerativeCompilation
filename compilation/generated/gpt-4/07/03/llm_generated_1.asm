//compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Preserve frame and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform integer arithmetic: int1 * 3 - int2
// Store result in x4
mov w4, w0     // Copy int1 to w4
lsl w4, w4, #1 // w4 = int1 * 2
add w4, w4, w0 // w4 = int1 * 3
sub w4, w4, w1 // w4 = int1 * 3 - int2

// Store the result at address pointed by outInt
str w4, [x2]

// Load the address of the constant _3_0_data into x5 using GOT-relative addressing
adrp x5, _3_0_data@GOTPAGE
ldr  x5, [x5, _3_0_data@GOTPAGEOFF]
ldr  d3, [x5]

// Perform floating point arithmetic: double1 - double2 * 3
fmul d2, d1, d3 // d2 = double2 * 3
fsub d2, d0, d2 // d2 = double1 - double2 * 3

// Store the result at address pointed by outDouble
str  d2, [x3]

// Restore frame and link register
ldp x29, x30, [sp], #16

// Return
ret

// Constants and Data section
.section .data, "aw"
.align 3
_3_0_data:
.double 3.0
