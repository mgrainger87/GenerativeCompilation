.global _customFunction

.align 4  // Align to 16 bytes (2^4 = 16)
_customFunction:
    // Save callee saved registers and arguments that we will use later
    stp x19, x20, [sp, #-16]!  // Push onto the stack
    stp x21, x22, [sp, #-16]!
    stp x29, x30, [sp, #-16]!  // x29 is frame pointer, x30 is link register

    // Setup frame pointer
    mov x29, sp

    // Call strlen("constant")
    ldr x0, =8  // Load constant string length directly to save a function call
    str w0, [x4]  // Store result in *outInt

    // Handle *outDouble = double1 * 0 + double2 * 0;
    fmov d0, #0.0
    str d0, [x5]  // Store result in *outDouble

    // Restore callee saved registers and return
    ldp x29, x30, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ret
