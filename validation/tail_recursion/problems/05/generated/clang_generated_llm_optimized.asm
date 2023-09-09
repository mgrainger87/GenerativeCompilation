.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                            ; @customFunction
.cfi_startproc

; Check if double2 (d1) is 0.0
fcmp    d1, #0.0
beq     1f                              ; If true, branch to 1:

; Load constants 1.0 into d2 and 4.0 into d3
fmov    d2, #1.00000000
fmov    d3, #4.00000000

; Loop unrolling: Process 4 iterations in one go
3:
; Check if there's enough room to process 4 iterations
fcmp    d1, d3
blt     2f                              ; If less than 4.0, branch to 2:

; Adjust double1 and double2 for 4 iterations
fsub    d0, d0, d3
fsub    d1, d1, d3
b       3b                              ; Repeat loop

2:
; Check if double2 is zero now
fcmp    d1, #0.0
beq     1f

; Adjust double1 and double2 by subtracting 1.0 for remaining iterations
fsub    d0, d0, d2
fsub    d1, d1, d2
b       2b                              ; Repeat loop for remaining iterations

1:
; Set *outDouble = double1
str    d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
