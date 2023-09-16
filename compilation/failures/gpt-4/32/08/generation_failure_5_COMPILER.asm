; compiler_errors=5,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp9nf_e2k1-e204d0.s:19:1: error: unknown AArch64 fixup kind!
; adr x4, one_point_zero
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
_customFunction:
// Compare int2 (x1) with 0
cmp x1, #0

// If int2 <= 0, jump to the 'assign_values' label
ble assign_values

// Else, prepare for a recursive call to customFunction

// Increment int1 (x0) and decrement int2 (x1)
add x0, x0, #1
add x1, x1, #-1

// Load the address of the floating-point literal 1.0 into x4
adr x4, one_point_zero
// Load the value at that address into d2
ldr d2, [x4]

// Increment double2 (d1) using the loaded literal
fadd d1, d1, d2

// Save the link register to the stack (to preserve the return address)
stp x30, xzr, [sp, #-16]!

// Make the recursive call
bl _customFunction

// Restore the link register from the stack
ldp x30, xzr, [sp], #16

// Return
ret

// Label to assign values directly without recursion
assign_values:
// Store int1 (x0) to the address in outInt (x2)
str w0, [x2]

// Store double1 (d0) to the address in outDouble (x3)
str d0, [x3]

// Return
ret

.data
one_point_zero:
.double 1.0
