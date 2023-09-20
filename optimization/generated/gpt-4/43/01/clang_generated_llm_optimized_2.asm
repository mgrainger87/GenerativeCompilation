//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc

; Load constants outside of the loop
fmov	d1, #10.00000000              ; Load constant 10.0 into d1
fmov	d2, #2.00000000               ; Load constant 2.0 into d2

loop_start:
fcmp	d0, d1                        ; Compare double1 with 10.0
b.ge	1f                            ; If double1 >= 10.0, jump to the branch

; If double1 < 10.0
add	w1, w1, #1                    ; Increment int2
fadd	d0, d0, d2                   ; Add 2.0 to double1
b	loop_start                     ; Jump back to start of the loop

1:                                     ; Branch for double1 >= 10.0
add	w8, w0, w1                    ; Add int1 and int2
str	w8, [x2]                      ; Store result in outInt
ret
.cfi_endproc

.subsections_via_symbols
