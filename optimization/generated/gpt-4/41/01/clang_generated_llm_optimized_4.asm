//solution_number=4,compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Check if outInt (x2) is NULL
cmp	x2, #0
b.eq	LBB0_end  ; If x2 is NULL, branch to LBB0_end

; Add int1 (w0) to int2 (w1)
add	w1, w1, w0

; Store int2 into the memory location pointed by outInt
str	w1, [x2]

LBB0_end:
; Return from the function
ret

.cfi_endproc
