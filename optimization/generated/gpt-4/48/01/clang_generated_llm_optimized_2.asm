//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Check if int2 < 0, if true, store int1 in outInt and return
subs	w3, w1, #0
blt	2f

; Check evenness of int2 using bitwise operation
and	w4, w1, #1
cbnz	w4, 1f   ; If odd, jump to label 1

; Even case
add	w0, w0, #3
subs	w1, w1, #2
b	3f       ; Jump to loop check

; Odd case
1:
add	w0, w0, #4
subs	w1, w1, #1

; Loop check and iterate
3:
cmp	w1, #0
bge	_customFunction

; Store the result to outInt
2:
str	w0, [x2]
ret
.cfi_endproc

.subsections_via_symbols
