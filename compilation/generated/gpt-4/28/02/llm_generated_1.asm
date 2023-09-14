//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Save the link register and adjust the stack for local variables.
// We are storing 3 registers: x19, x20, and lr (x30)
stp x19, x20, [sp, #-16]!
stp x29, x30, [sp, #-16]!
add x29, sp, #16

// Initial assignment: *outInt = int1;
str w0, [x2]

// Prepare for the loop: int i = 0;
mov w19, wzr // w19 will be used as our loop counter 'i'

loop_start:
// Check the loop condition: i < (int)double1
fcvtzs w20, d0  // Convert double1 to int, store in w20
cmp w19, w20   // Compare i and (int)double1
b.ge loop_end  // If i >= (int)double1, exit loop

// Loop body: *outInt += int2;
ldr w21, [x2]   // Load current value of *outInt into w21
add w21, w21, w1  // Increment by int2
str w21, [x2]   // Store the result back to *outInt

// Increment loop counter: i++
add w19, w19, #1
b loop_start

loop_end:
// After loop: *outDouble = 0.0;
fmov d0, #0.0   // Move immediate float value 0.0 into d0
str d0, [x3]    // Store d0 to *outDouble

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ldp x19, x20, [sp], #16
ret
