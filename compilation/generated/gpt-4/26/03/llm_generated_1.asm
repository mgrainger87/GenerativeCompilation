//compiler_errors=1,linker_errors=0,execution_errors=2,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register
str     lr, [sp, #-16]!

// Check if outInt (x4) is NULL
cbz     x4, .Lskip_int_operations

// Initialize *outInt = 0
mov     w6, #0                   // Temporary register to hold 0
str     w6, [x4]                 // Store 0 to *outInt

// For loop setup
mov     w6, w0                   // Copy int1 to w6 (loop iterator)
cmp     w6, w1                   // Compare int1 with int2
bgt     .Lend_for                // If int1 > int2, exit loop

.Lstart_for:
ldr     w7, [x4]                 // Load *outInt to w7
add     w7, w7, w6               // Add iterator to *outInt
str     w7, [x4]                 // Store updated value to *outInt
add     w6, w6, #1               // Increment iterator
cmp     w6, w1                   // Compare iterator with int2
ble     .Lstart_for              // If iterator <= int2, loop again

.Lend_for:

.Lskip_int_operations:
// Check if outDouble (x5) is properly aligned
tst     x5, #7                   // Check if the pointer is 8-byte aligned
bne     .Lreturn                 // If not aligned, return without dereferencing

// Check if outDouble (x5) is NULL
cbz     x5, .Lreturn

// Initialize *outDouble = 0.0
fmov    d6, #0.0                 // Temporary register to hold 0.0
str     d6, [x5]                 // Store 0.0 to *outDouble

.Lreturn:
// Restore link register and return
ldr     lr, [sp], #16
ret
