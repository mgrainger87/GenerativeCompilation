//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0
.globl _customFunction
_customFunction:
.p2align    2
.cfi_startproc
// Store int1 (x0) to the address in outInt (x2)
str     w0, [x2]

// Store double1 (d0) to the address in outDouble (x3)
str     d0, [x3]

// Return
ret
.cfi_endproc
.subsections_via_symbols
