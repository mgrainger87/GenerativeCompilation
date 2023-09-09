.global _customFunction
.align 3
_customFunction:
// Arithmetic right shift int2 by 31 bits to produce a mask
asr x4, x1, #31

// Add the mask to int1
add x0, x0, x4

// Store the result in *outInt
str w0, [x2]

ret
