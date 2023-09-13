//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.build_version macos, 13, 0 sdk_version 13, 3
.globl _customFunction
_customFunction:
sub sp, sp, #16          ; Reserve space for x29 and x30
stp x29, x30, [sp]       ; Save x29 and x30
add x29, sp, #0          ; Update frame pointer

str x0, [x2]             ; Store int1 to outInt
str d0, [x3]             ; Store double1 to outDouble

ldp x29, x30, [sp]       ; Restore x29 and x30
add sp, sp, #16          ; Restore stack pointer
ret                      ; Return from the function
.subsections_via_symbols
