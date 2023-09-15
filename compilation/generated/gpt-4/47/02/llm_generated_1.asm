//compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
.globl _helperFunction
.align 2
_helperFunction:
fneg    d0, d0       ; Negate the input double value
ret                 ; Return with the negated value in d0

.globl _customFunction
.align 2
_customFunction:
; Save the link register and an additional register for stack alignment
stp     lr, x19, [sp, #-16]!

; *outInt = int1;
str     w0, [x2]

; Call helperFunction to compute *outDouble
fmov    d0, d1       ; Move double2 to d0 for the function call using fmov
bl      _helperFunction

; Store result from helperFunction into *outDouble
str     d0, [x3]

; Restore the link register and the additional register
ldp     lr, x19, [sp], #16
ret
