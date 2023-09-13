//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
// Store the integer value in the pointer location provided.
str     w0, [x2]         // *outInt = int1;

// Store the double value in the pointer location provided.
str     d0, [x3]         // *outDouble = double1;

ret
.cfi_endproc
.subsections_via_symbols
