; compiler_errors=1,linker_errors=0,execution_errors=4,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzyipm6mp.asm:9:1: error: unrecognized instruction mnemonic
; cfi_def_cfa_offset 192
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpzyipm6mp.asm:42:1: error: unrecognized instruction mnemonic
; cfi_def_cfa_offset 0
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
sub sp, sp, #192
cfi_def_cfa_offset 192
stp x29, x30, [sp, #160]
stp x19, x20, [sp, #144]
stp x21, x22, [sp, #128]
stp x23, x24, [sp, #112]
stp x25, x26, [sp, #96]
stp x27, x28, [sp, #80]
stp x8, x9, [sp, #64]
stp x19, x20, [sp, #48]
stp x21, x22, [sp, #32]
stp x23, x24, [sp, #16]
stp x25, x26, [sp]
add x29, sp, #160
mov x19, x0
mov x20, x1
ldr d0, [x2]                    // Load double1 into d0
ldr d1, [x3]                    // Load double2 into d1
ldr x8, [x29, #16]
ldr x9, [x29, #80]
str x19, [x9]                   // Store int1 from x19
str x20, [x8]                   // Store int2 from x20
add sp, sp, #192
ldp x29, x30, [sp, #160]
ldp x19, x20, [sp, #144]
ldp x21, x22, [sp, #128]
ldp x23, x24, [sp, #112]
ldp x25, x26, [sp, #96]
ldp x27, x28, [sp, #80]
ldp x8, x9, [sp, #64]
ldp x19, x20, [sp, #48]
ldp x21, x22, [sp, #32]
ldp x23, x24, [sp, #16]
ldp x25, x26, [sp]
cfi_def_cfa_offset 0
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
