//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc

// Store frame pointer and link register
stp x29, x30, [sp, #-16]!
add x29, sp, #0

// Store int1 to the location pointed by outInt
str w0, [x2]

// Store double1 to the location pointed by outDouble
str d0, [x3]

// Restore frame pointer and link register
ldp x29, x30, [sp], #16

ret
.cfi_endproc
