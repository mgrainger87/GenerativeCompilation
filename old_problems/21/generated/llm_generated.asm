    .section    __TEXT,__text,regular,pure_instructions
    .align    2

    .globl _customFunction
_customFunction:
    // Preserve the frame pointer
    stp x29, x30, [sp, #-16]!  // Store pair of registers to the stack
    mov x29, sp

    // a = int1
    mov x4, x0

    // a += int2
    add x4, x4, x1

    // *outInt = int2
    str x1, [x2]

    // *outDouble = double1 + double2
    fadd d2, d0, d1
    str d2, [x3]

    // Restore the frame pointer and return
    ldp x29, x30, [sp], #16
    ret
