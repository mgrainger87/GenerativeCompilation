    .globl  _customFunction
    .align  2
_customFunction:
    // Function prologue
    stp     x29, x30, [sp, #-16]! // Save frame pointer and return address
    mov     x29, sp               // Set frame pointer
    
    // Initialize result = 0
    mov     w4, #0                // Use w4 as the result register
    
    // Calculate int1 & 3
    and     w5, w0, #3            // Use w5 as the loop limit register

    // Check loop condition: i < (int1 & 3)
    cbz     w5, .Lend_for_loop    // If w5 == 0, skip the loop

.Lfor_loop:
    // Inside the loop: result += int2
    add     w4, w4, w1            // result += int2
    
    // Decrement loop counter and check
    subs    w5, w5, #1            // Decrement w5
    b.ne    .Lfor_loop            // If w5 is not 0, repeat loop

.Lend_for_loop:
    // Store the result to *outInt
    str     w4, [x2]
    
    // Calculate double1 + double2 and store in *outDouble
    fadd    d4, d0, d1            // Use d4 as a temporary register
    str     d4, [x3]
    
    // Function epilogue
    ldp     x29, x30, [sp], #16   // Restore frame pointer and return address
    ret
