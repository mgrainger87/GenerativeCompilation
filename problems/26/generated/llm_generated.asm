    .section __TEXT,__text,regular,pure_instructions
    .align 2

_customFunction:
    .globl _customFunction     // Make the function globally visible for the linker

    // Store lr (link register) to preserve the return address
    sub     sp, sp, #16        // Decrement the stack pointer by 16 bytes
    str     lr, [sp]           // Store lr at the current stack pointer location

    // Perform integer operations
    add     w8, w0, w1         // tmp = int1 + int2
    sub     w8, w0, w1         // tmp = int1 - int2
    str     w8, [x2]           // *outInt = tmp

    // Perform floating point operations
    fadd    d8, d0, d1         // tmp_double = double1 + double2
    str     d8, [x3]           // *outDouble = tmp_double

    // Restore lr and return
    ldr     lr, [sp]           // Load lr from the current stack pointer location
    add     sp, sp, #16        // Increment the stack pointer back to its original position
    ret
