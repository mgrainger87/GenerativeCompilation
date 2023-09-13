//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.text
.global _customFunction
_customFunction:
// Save callee-saved registers and frame pointer if modified.
STP X29, X30, [SP, #-16]!  // Save FP and LR to the stack.
MOV X29, SP                // Set up the frame pointer.

// Perform the operations as per the C code.
STR W0, [X2]               // Store int1 into *outInt.
STR D0, [X3]               // Store double1 into *outDouble.

// Restore the registers and return.
LDP X29, X30, [SP], #16    // Restore FP and LR from the stack.
RET                        // Return to the caller.
