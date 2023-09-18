; solution_number=5,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo37l6tpm.asm:9:13: error: expected 'sxtx' 'uxtx' or 'lsl' with optional integer in range [0, 4]
; cmp x3, x2, #4
;             ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpo37l6tpm.asm:13:10: error: invalid operand for instruction
; stp wzr, xzr, [x2]
;          ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Check if x2 and x3 are adjacent
cmp	x3, x2, #4
b.ne	1f

; Store both values using a single paired store instruction
stp	wzr, xzr, [x2]
b	2f

1:
; Fallback to individual stores
str	xzr, [x3]
str	wzr, [x2]

2:
ret
.cfi_endproc
