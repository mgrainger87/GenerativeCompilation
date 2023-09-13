//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction     ; Mark symbol as global and prefix with "_", following Clang's convention for C
.align 4                   ; Align the function for 16 bytes, which is standard for ARM64
_customFunction:
stp x19, x20, [sp, #-16]!  ; Save x19 and x20 onto the stack

mov x19, x0              ; Store int1 into x19
mov x20, x1              ; Store int2 into x20 (although not really necessary since we don't use int2)
; The doubles are already in d0 and d1, no need for any moves

str w19, [x2]            ; Store the int value from x19 (int1) to the memory pointed by outInt
str d0, [x3]             ; Store the double value from d0 (double1) to the memory pointed by outDouble

ldp x19, x20, [sp], #16  ; Restore x19 and x20 from the stack
ret                      ; Return from the function
