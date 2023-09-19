//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; Check if int1 (w0) is 0
cbz    w0, .Lset_outInt

; Otherwise, make a recursive call
; Prepare parameters for the recursive call
sub    w0, w0, #1
add    w1, w1, #1

; Save the link register (x30) to stack before branching
stp    x29, x30, [sp, #-16]!
bl    _customFunction
; Restore the link register (x30) from stack after returning
ldp    x29, x30, [sp], #16

ret

.Lset_outInt:
; Set *outInt to int2
str    w1, [x2]
ret

.cfi_endproc
; -- End function
