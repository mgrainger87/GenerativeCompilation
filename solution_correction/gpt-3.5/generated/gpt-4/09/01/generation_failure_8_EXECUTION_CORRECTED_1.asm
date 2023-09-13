//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
_customFunction:
// Prologue: Save callee-saved registers and frame pointer
stp x29, x30, [sp, -16]!
mov x29, sp

// Check if outInt is non-NULL and store int1
cbz x2, .Lskip_int_store
str w0, [x2]

.Lskip_int_store:
// Check if outDouble is non-NULL and store double1
cbz x3, .Lexit
str d0, [x3]

.Lexit:
// Epilogue: Restore callee-saved registers and frame pointer
ldp x29, x30, [sp], 16
ret
