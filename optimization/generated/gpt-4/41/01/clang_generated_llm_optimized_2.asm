//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

LBB0_loop:
; Check if int1 (w0) is zero
cmp	w0, #0
b.eq	LBB0_1  ; If int1 is zero, branch to LBB0_1

; Decrement int1
sub	w0, w0, #1

; Increment int2
add	w1, w1, #1

; Continue the loop
b	LBB0_loop

LBB0_1:
; Store int2 into the memory location pointed by outInt
str	w1, [x2]

; Return from the function
ret

.cfi_endproc
