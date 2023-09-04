    .globl _customFunction
    .align 2
_customFunction:
    // Prologue: Save frame pointer and link register
    stp x29, x30, [sp, #-16]!  // Push x29 and x30 onto the stack
    mov x29, sp                // Set frame pointer to stack pointer

    // Check if int1 > int2 && int1 < int2
    // This is always false. So, we skip the body of this condition.
    // There is no code generated for this condition.

    // *outDouble = double1 + double2;
    fadd d0, d0, d1            // Add d0 and d1 and store result in d0
    str d0, [x3]               // Store result in *outDouble

    // Epilogue: Restore frame pointer and link register and return
    ldp x29, x30, [sp], #16   // Pop x29 and x30 from the stack
    ret
