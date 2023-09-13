//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0    sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
// Save frame pointer and link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// Store int1 to *outInt
str w0, [x2]

// Store double1 to *outDouble
str d0, [x3]

// Restore frame pointer and link register, and return
ldp x29, x30, [sp], #16
ret
.cfi_endproc
.subsections_via_symbols
