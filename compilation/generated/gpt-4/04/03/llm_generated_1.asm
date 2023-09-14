//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store the link register (return address)
stp x30, x29, [sp, #-16]!
mov x29, sp

// *outInt = int1; -> Dereference outInt and store int1
str w0, [x2]

// *outDouble = double2; -> Dereference outDouble and store double2
str d1, [x3]

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
