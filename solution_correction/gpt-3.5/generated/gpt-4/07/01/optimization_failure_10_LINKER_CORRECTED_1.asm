//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl	_customFunction
.p2align	2
_customFunction:
// Create a stack frame and preserve callee-saved registers
sub sp, sp, #16       // Allocate stack space
stp x29, x30, [sp]   // Save frame pointer and return address

// Set up frame pointer for this function
add x29, sp, #16

// The parameters are already in the correct registers as per the calling convention
// int1 is in x0, double1 is in d0, outInt is in x2, outDouble is in x3

// Store int1 to the memory location pointed by outInt
str w0, [x2]

// Store double1 to the memory location pointed by outDouble
str d0, [x3]

// Restore the stack and return
ldp x29, x30, [sp]   // Restore frame pointer and return address
add sp, sp, #16      // Deallocate stack space
ret
