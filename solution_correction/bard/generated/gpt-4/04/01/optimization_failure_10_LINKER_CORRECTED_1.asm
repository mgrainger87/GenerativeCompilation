//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0 sdk_version 13, 3

.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
// Save frame and link registers
stp	x29, x30, [sp, #-16]!
mov	x29, sp

// Implement the logic: *outInt = int1
str	w0, [x2]

// Implement the logic: *outDouble = double1
str	d0, [x3]

// Restore frame and link registers
ldp	x29, x30, [sp], #16
ret
.cfi_endproc

.subsections_via_symbols
