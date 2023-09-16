; compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
; ; Compiler error: /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpayz1ncd1.asm:13:5: error: unexpected floating point literal
; beq .1equal
;     ^
; /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpayz1ncd1.asm:24:1: error: unexpected token at start of statement
; .1equal:
; ^
; 
; ; Linker error: None
; ; Execution error: None
; ; Correctness error: None
.global _customFunction
.align  3

_customFunction:
// Load 0.1 into d2 for further operations
adrp    x8, .Lconst
ldr     d2, [x8, #:lo12:.Lconst]

// 1. Compare double1 (d0) and double2 (d1)
fcmp    d0, d1

// 2. If double1 and double2 are equal, jump to equal block
beq     .1equal

// 3. If not equal, adjust arguments for recursive call
add     w1, w1, #1               // Increment int2
fsub    d0, d0, d2               // Subtract 0.1 from double1
fadd    d1, d1, d2               // Add 0.1 to double2
bl      _customFunction          // Recursive call

ret

// Equal block
.1equal:
str     w1, [x2]                 // Store int2 to *outInt
str     d1, [x3]                 // Store double2 to *outDouble
ret

// Constant pool for floating point values
.align  3
.Lconst:
.double 0.1
