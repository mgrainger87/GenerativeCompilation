; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpy05hpkx7.asm:27:6: error: invalid operand for instruction
; movz d8, #0
;      ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
_customFunction:
// Save the link register (x30) and x19 which we will use as our loop counter
stp x30, x19, [sp, #-16]!

// Step 2: Directly assign int1 to *outInt
str w0, [x2]  // w0 because it's a 32-bit int

// Step 3: Implement the for-loop
mov w19, #0   // initialize loop counter (i) with 0

loop_start:
cmp w19, w1   // compare i with int2
b.ge loop_end // if i >= int2, exit loop

// Inside loop: double the value of *outInt
ldr w8, [x2]  // load *outInt into w8
lsl w8, w8, #1  // logical shift left by 1 (i.e., multiply by 2)
str w8, [x2]  // store the doubled value back to *outInt

// Increment loop counter
add w19, w19, #1
b loop_start  // loop back to loop_start

loop_end:
// Step 4: Assign 0.0 to *outDouble
movz d8, #0   // move 0.0 into d8
str d8, [x3]  // store 0.0 to *outDouble

// Step 5: Restore saved registers and return
ldp x30, x19, [sp], #16
ret
