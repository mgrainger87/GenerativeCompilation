    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Save callee-saved registers (if needed)
    // None needed in this case since we're not using any callee-saved registers.

    // Load immediate values into registers
    mov x4, #3
    mul x5, x0, x4      // int1 * 3
    mov x4, #4
    mul x6, x0, x4      // int1 * 4
    add x5, x5, x6
    str x5, [x2]        // store result to *outInt

    // Load floating point constants
    fmov d2, #2.0
    fmov d3, #5.0
    fmul d4, d0, d2     // double1 * 2
    fmul d5, d0, d3     // double1 * 5
    fadd d4, d4, d5
    str  d4, [x3]       // store result to *outDouble

    // Restore callee-saved registers (if we had saved any)
    // None to restore in this case since we didn't use any callee-saved registers.

    ret

    .end
