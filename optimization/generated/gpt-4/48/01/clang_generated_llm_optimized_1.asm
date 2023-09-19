//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub	sp, sp, #64
.cfi_def_cfa_offset 64
stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
add	x29, sp, #48
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
str	x2, [sp, #16]                   ; Save outInt pointer

loop_start:
subs	w8, w1, #0                     ; Check if int2 is negative
cset	w8, ge
tbnz	w8, #0, even_check             ; If int2 >= 0, jump to even_check

; Base case
str	w0, [x2]                       ; Store int1 to outInt
b	exit_function                   ; Exit the function

even_check:
mov	w10, #2
sdiv	w9, w1, w10                    ; Calculate int2 % 2
mul	w9, w9, w10
subs	w8, w1, w9
cset	w8, ne
tbnz	w8, #0, odd_case               ; If int2 is odd, jump to odd_case

; Even case
add	w0, w0, #3                     ; int1 + 3
subs	w1, w1, #2                     ; int2 - 2
b	loop_start                      ; Jump back to the start of the loop

odd_case:
add	w0, w0, #4                     ; int1 + 4
subs	w1, w1, #1                     ; int2 - 1
b	loop_start                      ; Jump back to the start of the loop

exit_function:
ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
add	sp, sp, #64
ret
.cfi_endproc
