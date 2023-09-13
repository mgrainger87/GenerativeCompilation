	.globl	_customFunction
	.align	2
_customFunction:
    // Save callee-saved registers if used (none in this function)

    // Initialize i (using x4 for i)
    mov     x4, #0              // i = 0

1:  // Start of loop
    cmp     x4, #4              // Compare i with 4
    b.ge    2f                  // If i >= 4, exit loop

    // Multiply int1 by itself and store in *outInt
    mul     x5, x0, x0          // x5 = int1 * int1
    str     x5, [x2]            // *outInt = x5

    add     x4, x4, #1          // i++
    b       1b                  // Jump to start of loop

2:  // End of loop

    // Restore callee-saved registers if saved (none in this function)

    ret
