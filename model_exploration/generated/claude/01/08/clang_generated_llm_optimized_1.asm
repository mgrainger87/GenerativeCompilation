//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0 sdk_version 13, 3
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc

// x0 = int1
// x1 = int2
// d0 = double1
// d1 = double2
// x2 = outInt
// x3 = outDouble

str x30, [sp, #-16]! // save link register
stp x29, x30, [sp, #-16]! // save frame pointer and link register
mov x29, sp // setup frame pointer

str w0, [x2] // store int1 to outInt
str d0, [x3] // store double1 to outDouble

ldp x29, x30, [sp], #16 // restore frame pointer and link register
ldr x30, [sp], #16 // restore link register
ret

.cfi_endproc
.subsections_via_symbols
