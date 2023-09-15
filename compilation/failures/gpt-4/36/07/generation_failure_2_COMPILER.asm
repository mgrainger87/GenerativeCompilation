; compiler_errors=2,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp15ejiude-eeb53a.s:9:1: error: ADR/ADRP relocations must be GOT relative
; adrp x8, .Lconst
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp15ejiude-eeb53a.s:9:1: error: unknown AArch64 fixup kind!
; adrp x8, .Lconst
; ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp15ejiude-eeb53a.s:10:1: error: unknown AArch64 fixup kind!
; ldr d2, [x8, #:lo12:.Lconst]
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
; .global _customFunction
.align  3

_customFunction:
// Load 0.1 into d2 for further operations
adrp    x8, .Lconst
ldr     d2, [x8, #:lo12:.Lconst]

// 1. Compare double1 (d0) and double2 (d1)
fcmp    d0, d1

// 2. If double1 and double2 are equal, jump to equal block
beq     L_equal

// 3. If not equal, adjust arguments for recursive call
add     w1, w1, #1               // Increment int2
fsub    d0, d0, d2               // Subtract 0.1 from double1
fadd    d1, d1, d2               // Add 0.1 to double2
bl      _customFunction          // Recursive call

ret

// Equal block
L_equal:
str     w1, [x2]                 // Store int2 to *outInt
str     d1, [x3]                 // Store double2 to *outDouble
ret

// Constant pool for floating point values
.align  3
.Lconst:
.double 0.1
