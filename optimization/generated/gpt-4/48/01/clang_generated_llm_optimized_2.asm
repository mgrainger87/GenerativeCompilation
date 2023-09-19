//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #16                     ; Adjust stack by only 16 bytes
.cfi_def_cfa_offset 16
stp	x29, x30, [sp, #0]              ; Save frame pointer and link register
add	x29, sp, #16
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

loop_start:
subs	w8, w1, #0                     ; Check if int2 is negative
cset	w8, ge
tbnz	w8, #0, even_check             ; If int2 >= 0, jump to even_check

; Base case
str	w0, [x2]                       ; Store int1 to outInt
b	exit_function                   ; Exit the function

even_check:
ands	w8, w1, #1                     ; Check if int2 is even by testing least significant bit
cbz	w8, even_case                  ; If int2 is even, jump to even_case

; Odd case
add	w0, w0, #4                     ; int1 + 4
subs	w1, w1, #1                     ; int2 - 1
b	loop_start                      ; Jump back to the start of the loop

even_case:
add	w0, w0, #3                     ; int1 + 3
subs	w1, w1, #2                     ; int2 - 2
b	loop_start                      ; Jump back to the start of the loop

exit_function:
ldp	x29, x30, [sp, #0]              ; Reload frame pointer and link register
add	sp, sp, #16                     ; Adjust stack back
ret
.cfi_endproc
