//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.align 2
.globl _customFunction
_customFunction:
stp x29, x30, [sp, -16]!      // Store frame pointer and link register
mov x29, sp                  // Update frame pointer

// Check if outInt is a valid pointer
cbnz x2, .outIntValid        // If x2 (outInt) is not null, jump to outIntValid
b .copyDouble                // If x2 is null, jump to copyDouble

.outIntValid:
str w0, [x2]                 // Store w0 (int1) into the memory pointed by x2 (outInt)

.copyDouble:
cbnz x3, .outDoubleValid     // If x3 (outDouble) is not null, jump to outDoubleValid
b .done                      // If x3 is null, jump to done

.outDoubleValid:
str d0, [x3]                 // Store d0 (double1) into the memory pointed by x3 (outDouble)

.done:
ldp x29, x30, [sp], 16       // Restore frame pointer and link register
ret                          // Return
