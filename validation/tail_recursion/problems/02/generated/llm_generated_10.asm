.global _customFunction
.align 3
_customFunction:
// Compare int2 to 0
cmp x1, #0

// Conditionally invert int2 if it's non-zero. Otherwise, leave it as is.
csinv x1, x1, x1, eq

// Add the potentially inverted int2 to int1
add x0, x0, x1

// Store the result in *outInt
str w0, [x2]

ret
