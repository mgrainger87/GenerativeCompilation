//solution_number=5,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Calculate x2 + 4
add	x8, x2, #4
; Compare x8 with x3 to check if they are adjacent
cmp	x3, x8
b.ne	1f

; If adjacent, use sequential stores
str	wzr, [x2]
str	xzr, [x3]
b	2f

1:
; Fallback to individual stores
str	xzr, [x3]
str	wzr, [x2]

2:
ret
.cfi_endproc
