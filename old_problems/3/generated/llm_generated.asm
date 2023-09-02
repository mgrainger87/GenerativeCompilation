    .text
    .globl _helperFunction
    .align  3
_helperFunction:
    mov     x0, #0       // Multiply x with 0, effectively setting x0 to 0
    ret                  // Return

    .globl _customFunction
    .align  3
_customFunction:
    // Preserve lr (link register) by pushing it onto the stack
    sub     sp, sp, #16   // Allocate space on the stack
    str     lr, [sp]      // Store lr on the stack

    // Call helperFunction with int1 as argument
    bl      _helperFunction

    // After the call, the result is in x0. Add 5 to it.
    add     x0, x0, #5
    str     w0, [x4]     // Store the result in *outInt

    // Compute double1 * 1 + double2 * 1 + 0.0 and store in *outDouble
    fadd    d0, d0, d1   // Add double1 and double2
    str     d0, [x5]     // Store the result in *outDouble

    // Restore lr from the stack and adjust the stack pointer
    ldr     lr, [sp]      // Load lr from the stack
    add     sp, sp, #16   // Deallocate space from the stack
    ret
