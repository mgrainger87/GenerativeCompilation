//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section __TEXT,__text,regular,pure_instructions
.macosx_version_min 13, 0
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc

// x0 = int1, x1 = int2, d0 = double1, d1 = double2
// x2 = _outInt, x3 = _outDouble

stp x29, x30, [sp, #-16]!
mov x29, sp

str w0, [x2]     // store int1 to _outInt
str d0, [x3]     // store double1 to _outDouble

ldp x29, x30, [sp], #16
ret

.cfi_endproc
