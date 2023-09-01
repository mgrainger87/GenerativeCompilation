    .globl  _customFunction
    .align  3
_customFunction:
    // Save link register (return address) and adjust stack
    sub     sp, sp, #16
    str     lr, [sp]

    // Directly set *outInt to 8, the length of "constant"
    mov     w0, #8
    str     w0, [x4]

    // Compute *outDouble = double1 * 0 + double2 * 0;
    fmov    d0, #0.0                 // Load 0.0 into d0
    fmul    d0, d0, d1               // Multiply d0 (0.0) with d1 (double2), result in d0
    str     d0, [x5]                 // Store result in *outDouble

    // Restore link register and return
    ldr     lr, [sp]
    add     sp, sp, #16
    ret
