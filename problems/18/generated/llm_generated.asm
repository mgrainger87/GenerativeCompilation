    .section __TEXT,__text,regular,pure_instructions
    .align 3
    .globl _customFunction
_customFunction:
    // Load the constant 2.5's representation into an integer register
    mov x4, #0x4004000000000000

    // Transfer it to a floating-point register
    fmov d2, x4

    // Perform the multiplication
    fmul d0, d0, d2     // d0 = double1 * 2.5

    // Add double2
    fadd d0, d0, d1     // d0 = (double1 * 2.5) + double2

    // Store the result at the address in x3
    str d0, [x3]

    // Return
    ret
