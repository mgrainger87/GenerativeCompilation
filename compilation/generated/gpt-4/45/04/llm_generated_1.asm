//compiler_errors=0,linker_errors=1,execution_errors=1,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.align      2               ; Align to 4-byte boundary

.global _helperFunction
_helperFunction:
fdiv    d0, d0, d1      ; d0 = a / b
ret

.align      2               ; Align to 4-byte boundary

.global _customFunction
_customFunction:
; Save link register to stack
stp     x30, x29, [sp, #-16]!

; Store int2 to *outInt
str     w1, [x2]

; Call helperFunction
bl      _helperFunction

; Restore link register from stack
ldp     x30, x29, [sp], #16

; Store the result to *outDouble
str     d0, [x3]

ret
