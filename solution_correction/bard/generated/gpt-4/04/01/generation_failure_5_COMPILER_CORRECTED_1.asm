//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.macosx_version_min 11, 0
.globl _customFunction
# Follow Clang conventions for C: name mangling with a leading underscore
.align  2
# Align symbols appropriately for arm64

_customFunction:

# Store the callee-saved registers (we use x19-x21)
stp x19, x20, [sp, #-16]!
str x21, [sp, #-16]!

# Move the input arguments to our working registers
mov x19, x0
mov x20, x1
mov x21, x2

# Store the values
str w19, [x21]
str d0, [x3]

# Restore the callee-saved registers
ldr x21, [sp], #16
ldp x19, x20, [sp], #16

ret
