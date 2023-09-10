//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section __TEXT,__text,regular,pure_instructions
.globl _customFunction
.p2align 2
_customFunction:
.cfi_startproc

// x0 = int1, x1 = int2, d0 = double1, d1 = double2
// x2 = _outInt, x3 = _outDouble

// Save callee-saved registers x19-x28 on stack
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!

// Save parameters on stack
str w0, [sp, #40]   // int1
str w1, [sp, #36]   // int2
str d0, [sp, #24]   // double1
str d1, [sp, #16]   // double2

// Load _outInt and _outDouble pointers into registers
mov x10, x2
mov x11, x3

// Load int1 and double1 into registers
ldr w8, [sp, #40]
ldr d0, [sp, #24]

// Store int1 and double1 to outputs
str w8, [x10]
str d0, [x11]

// Restore callee-saved registers from stack
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16

.cfi_endproc
ret
