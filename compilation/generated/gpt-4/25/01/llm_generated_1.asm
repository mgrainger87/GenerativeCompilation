//compiler_errors=0,linker_errors=2,execution_errors=4,correctness_errors=0
.global _assemblyMain
.global _customFunction
.global _customFunctionDouble

.align 2
_assemblyMain:
// Prologue
stp x29, x30, [sp, #-16]!
mov x29, sp

// Load command-line arguments into registers
ldr x0, [x0, #0x20]  // int1
ldr x1, [x0, #0x28]  // int2
ldr d0, [x0, #0x30]  // double1
ldr d1, [x0, #0x38]  // double2
ldr x5, [x0, #0x40]  // address for int output
ldr x6, [x0, #0x48]  // address for double output

// Call _customFunction for integer arithmetic
bl _customFunction
str x0, [x5]          // Store the result of customFunction into the int output address

// Call _customFunctionDouble for double arithmetic
bl _customFunctionDouble
str d0, [x6]          // Store the result of customFunctionDouble into the double output address

// End _assemblyMain function
mov x0, #0            // Set exit status code to 0
ldp x29, x30, [sp], #16
ret

.align 2
_customFunction:
// Prologue
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform integer arithmetic: (x0 + x1)
add x0, x0, x1

// End customFunction
ldp x29, x30, [sp], #16
ret

.align 2
_customFunctionDouble:
// Prologue
stp x29, x30, [sp, #-16]!
mov x29, sp

// Perform double arithmetic: (d0 + d1)
fadd d0, d0, d1

// End customFunctionDouble
ldp x29, x30, [sp], #16
ret
