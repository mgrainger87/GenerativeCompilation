//compiler_errors=1,linker_errors=1,execution_errors=0,correctness_errors=0
.global _customFunction

.align 2
_customFunction:
// Save the link register (x30) and frame pointer (x29) on the stack
stp x29, x30, [sp, #-16]!
mov x29, sp

// Check the condition (int2 <= 0)
cmp x1, #0
ble .Lbranch_true

// else block: recursive call to customFunction
add x0, x0, #1      // int1 + 1
sub x1, x1, #1      // int2 - 1

// Load the immediate floating point value into a register and then use it for addition
fmov d2, #1.0       // Move 1.0 to d2
fadd d1, d1, d2     // double2 + 1.0

bl _customFunction  // Call the function

// Restore x29 and x30, then return
ldp x29, x30, [sp], #16
ret

.align 2
.Lbranch_true:
// Assign values
str x0, [x2]        // *outInt = int1;
str d0, [x3]        // *outDouble = double1;

// Restore x29 and x30, then return
ldp x29, x30, [sp], #16
ret
