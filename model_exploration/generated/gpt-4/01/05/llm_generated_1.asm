//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2

_customFunction:
// Store int1 (x0) to *outInt (x2)
str     w0, [x2]

// Store double1 (d0) to *outDouble (x3)
str     d0, [x3]

ret
