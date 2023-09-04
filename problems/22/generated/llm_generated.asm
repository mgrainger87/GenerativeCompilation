.global _customFunction
.align 2

_customFunction:
    // Prologue: Store registers that need to be preserved.
    // Here, since we're not calling any other functions, we don't need to store LR.
    // Also, no callee-saved registers are modified, so we don't need to store them.
    // However, we might need to adjust the stack for local storage, but we can check this later.

    // Compute int1 + int2
    add w4, w0, w1

    // Store the result of int1 + int2 into *outInt
    str w4, [x2]

    // Compute double1 + double2
    fadd d4, d0, d1

    // Store the result of double1 + double2 into *outDouble
    str d4, [x3]

    // Epilogue: Restore any saved registers (none in this case) and return
    ret
