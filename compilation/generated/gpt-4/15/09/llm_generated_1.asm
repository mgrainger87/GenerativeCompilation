//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!      ; Push x29 (frame pointer) and x30 (link register) onto the stack
mov x29, sp                    ; Set x29 to the current stack pointer (start of this frame)

; Check if double1 (d0) is 0.0
fcmp d0, #0.0                  ; Compare d0 with 0.0
b.ne _double1_not_zero         ; If d0 is not 0.0, branch to _double1_not_zero

; If double1 == 0.0
add w4, w0, w1                 ; Calculate int1 + int2
str w4, [x2]                   ; Store the result at the address pointed to by outInt
fmov d4, #1.0                  ; Load 1.0 into d4
str d4, [x3]                   ; Store 1.0 at the address pointed to by outDouble
b _end_customFunction          ; Branch to the end of the function

_double1_not_zero:
; If double1 != 0.0
sub w4, w0, w1                 ; Calculate int1 - int2
str w4, [x2]                   ; Store the result at the address pointed to by outInt
str d0, [x3]                   ; Store double1 at the address pointed to by outDouble

_end_customFunction:
ldp x29, x30, [sp], #16        ; Pop x29 and x30 from the stack and adjust the stack pointer
ret                            ; Return from the function
