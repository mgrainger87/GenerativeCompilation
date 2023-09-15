; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp5h6xl_f2.asm:37:15: error: unexpected token in '.section' directive
; .section .data
;               ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global customFunction

customFunction:
// Save the link register to the stack
str     lr, [sp, #-16]!

// Compare double1 and double2
fcmp    d0, d1

// If double1 is equal to double2, then the branch is taken
beq     .equal

// Else, modify the values and call customFunction recursively
add     w1, w1, #1     // int2 = int2 + 1

// Load floating point literals into registers
adrp    x4, .Ldata      // Load address of the page containing .Ldata
ldr     d8, [x4, #:lo12:.Ldata]   // Load the value from .Ldata into d8
fsub    d0, d0, d8     // double1 = double1 - 0.1
fadd    d1, d1, d8     // double2 = double2 + 0.1

bl      customFunction // Recursively call customFunction

// Restore the link register and return
ldr     lr, [sp], #16
ret

.equal:
str     w1, [x2]       // *outInt = int2
str     d1, [x3]       // *outDouble = double2

// Restore the link register and return
ldr     lr, [sp], #16
ret

// Data section for floating point constant
.section .data
.Ldata:
.double 0.1
