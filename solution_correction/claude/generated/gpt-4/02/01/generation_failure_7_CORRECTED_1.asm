//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.align 2
.global _customFunction

_customFunction:
# Create stack space for saved registers
sub sp, sp, #32

# Save callee-saved registers and return address (lr)
stp x29, x30, [sp]

# Set up frame pointer
add x29, sp, #0

# Store int1 to *outInt
str w0, [x2]

# Store double1 to *outDouble
str d0, [x3]

# Restore saved registers and return address
ldp x29, x30, [sp]

# Restore stack pointer
add sp, sp, #32

ret
