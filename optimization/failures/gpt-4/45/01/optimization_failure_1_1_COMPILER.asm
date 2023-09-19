; solution_number=1,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp0rj_9u19-2a8c62.s:26:1: error: conditional branch requires assembler-local label. '.LBB0_2' is external.
; ble .LBB0_2 ; If double1 <= 50, branch
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0 sdk_version 13, 3
.section	__TEXT,__literal8,8byte_literals
.p2align	3
lCPI0_0:
.quad	0x4049000000000000              ; double 50

.section	__TEXT,__text,regular,pure_instructions
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

sub	sp, sp, #32                     ; Reduce stack allocation, only allocate what's needed
stp	x29, x30, [sp, #16]             ; Save frame and link registers
add	x29, sp, #16                    ; Set up frame pointer
str	x2, [sp, #8]                   ; Store outInt
str	x3, [sp, #0]                   ; Store outDouble

adrp	x8, lCPI0_0@PAGE               ; Load double 50 into d1
ldr	d1, [x8, lCPI0_0@PAGEOFF]
fcmp	d0, d1
ble	.LBB0_2                       ; If double1 <= 50, branch

; double1 > 50
fmov	d1, #5.00000000
fadd	d0, d1, d1                   ; Add double2 and 5
str	d0, [x3]                     ; Store result into *outDouble
b	.LBB0_3                       ; Jump to function end

.LBB0_2:
mov	w0, w1                        ; int2 becomes int1
mov	w1, w0                        ; int1 becomes int2
fadd	d0, d0, d1                   ; double1 + double2
ldr	x2, [sp, #8]                 ; Load outInt
ldr	x3, [sp, #0]                 ; Load outDouble
bl	_customFunction
.LBB0_3:

ldp	x29, x30, [sp, #16]          ; Restore frame and link registers
add	sp, sp, #32                  ; Restore stack pointer
ret

.cfi_endproc

.subsections_via_symbols
