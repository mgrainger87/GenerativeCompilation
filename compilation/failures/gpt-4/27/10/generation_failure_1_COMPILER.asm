; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpp1qzn1dd.asm:8:10: error: page or gotpage label reference expected
; adrp x4, :got_lo12:_double_literal_1_0
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!  // Save frame pointer and return address
mov x29, sp                // Set up frame pointer for this function

// Initialize *outDouble to 1.0
adrp x4, :got_lo12:_double_literal_1_0
ldr d5, [x4, :got_lo12:_double_literal_1_0]
str d5, [x3]

// Initialize loop counter i to 0
mov w4, wzr                // w4 will be our loop counter i

_loop_start:
// Check loop condition: i < int1
cmp w4, w0
b.ge _loop_end

// Multiply *outDouble by double1 * double2
fmul d5, d0, d1            // d5 = double1 * double2
ldr d6, [x3]               // Load *outDouble into d6
fmul d6, d6, d5            // d6 = d6 * d5
str d6, [x3]               // Store the result back to *outDouble

// Increment loop counter i
add w4, w4, #1
b _loop_start

_loop_end:
// Set *outInt to 0
mov w4, wzr
str w4, [x2]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
