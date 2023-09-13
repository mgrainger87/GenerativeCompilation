//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0    sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
// Store int1 (x0) to the location pointed by outInt (x2)
str     w0, [x2]

// Store double1 (d0) to the location pointed by outDouble (x3)
str     d0, [x3]

ret
.cfi_endproc
.subsections_via_symbols
