; compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program crashed. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=0', 'int2=0', 'double1=0.0', 'double2=0.0', 'expectedInt=0', 'expectedDouble=0.0']
; Crash detected on thread 1:
; Registers:
; x0 = 0x0000000000000000
; x1 = 0x0000000000000000
; x2 = 0x000000016fdff998
; x3 = 0x000000016fdff990
; x4 = 0x0000000000000000
; x5 = 0x0000000000000003
; x6 = 0x000000000000000a
; x7 = 0x0000000000000000
; x8 = 0x0000000000000000
; x9 = 0x0000000000000064
; x10 = 0x0000000000000002
; x11 = 0x00000000fffffffd
; x12 = 0x0000010000000000
; x13 = 0x0000000000000000
; x14 = 0x0000000000000000
; x15 = 0x0000000000000000
; x16 = 0x00000001ac3e092c
; x17 = 0x000000020bfc7298
; x18 = 0x0000000000000000
; x19 = 0x0000000100003a50
; x20 = 0x000000010000c000
; x21 = 0x000000010000d910
; x22 = 0x000000016fdffb30
; x23 = 0x00000001ac1423c6
; x24 = 0x000000016fdffab0
; x25 = 0x0000000000000001
; x26 = 0x0000000000000000
; x27 = 0x0000000000000000
; x28 = 0x0000000000000000
; fp = 0x000000016fdffa10
; lr = 0x0000000100003c78
; sp = 0x000000016fdff950
; pc = 0x0000000100003964
; cpsr = 0x80001000
; w0 = 0x00000000
; w1 = 0x00000000
; w2 = 0x6fdff998
; w3 = 0x6fdff990
; w4 = 0x00000000
; w5 = 0x00000003
; w6 = 0x0000000a
; w7 = 0x00000000
; w8 = 0x00000000
; w9 = 0x00000064
; w10 = 0x00000002
; w11 = 0xfffffffd
; w12 = 0x00000000
; w13 = 0x00000000
; w14 = 0x00000000
; w15 = 0x00000000
; w16 = 0xac3e092c
; w17 = 0x0bfc7298
; w18 = 0x00000000
; w19 = 0x00003a50
; w20 = 0x0000c000
; w21 = 0x0000d910
; w22 = 0x6fdffb30
; w23 = 0xac1423c6
; w24 = 0x6fdffab0
; w25 = 0x00000001
; w26 = 0x00000000
; w27 = 0x00000000
; w28 = 0x00000000
; v0 = None
; v1 = None
; v2 = None
; v3 = None
; v4 = None
; v5 = None
; v6 = None
; v7 = None
; v8 = None
; v9 = None
; v10 = None
; v11 = None
; v12 = None
; v13 = None
; v14 = None
; v15 = None
; v16 = None
; v17 = None
; v18 = None
; v19 = None
; v20 = None
; v21 = None
; v22 = None
; v23 = None
; v24 = None
; v25 = None
; v26 = None
; v27 = None
; v28 = None
; v29 = None
; v30 = None
; v31 = None
; fpsr = 0x00000000
; fpcr = 0x00000000
; s0 = 0
; s1 = 0
; s2 = 0
; s3 = 3.82047143E-37
; s4 = 0
; s5 = -0.0000410399261
; s6 = -1.46330601E+17
; s7 = 666490.813
; s8 = 0
; s9 = 0
; s10 = 0
; s11 = 0
; s12 = 0
; s13 = 0
; s14 = 0
; s15 = 0
; s16 = 1.40129846E-45
; s17 = 2.80259693E-45
; s18 = 1.08664755E-31
; s19 = 0
; s20 = 3.48465434E-9
; s21 = -0.0000410399261
; s22 = -1.42822676E+10
; s23 = 1.85781404E-31
; s24 = -2.67842921E-7
; s25 = 0.000626986846
; s26 = 3.88838691E-33
; s27 = 0.00000110927976
; s28 = 0.956446886
; s29 = 8.83692491E+21
; s30 = 1.06675893E+33
; s31 = 0
; d0 = 0
; d1 = 0
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = 0
; d5 = -1.9890829399938062E-92
; d6 = -1.1080016226206134E-121
; d7 = 2.0384801414851668E-156
; d8 = 0
; d9 = 0
; d10 = 0
; d11 = 0
; d12 = 0
; d13 = 0
; d14 = 0
; d15 = 0
; d16 = 4.9406564584124654E-324
; d17 = 9.8813129168249309E-324
; d18 = 5.9245434102707407E-270
; d19 = 0
; d20 = 8.5813160506344701E-254
; d21 = -1.9890829399938062E-92
; d22 = 4.0736827110120646E+242
; d23 = 2.9794972518179821E-252
; d24 = 2.1601944571584799E-256
; d25 = -1.1566860292070428E-303
; d26 = 5.738977024014792E-74
; d27 = -9.2279353468495361E-269
; d28 = 3.3990988093909771E+118
; d29 = 1.4370596099725725E+52
; d30 = 1.7060826889671998E+240
; d31 = 0
; far = 0x00000001ac2e6794
; esr = 0x02000000
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_INSTRUCTION (code=1, subcode=0xa8c17bfe)
; Thread 15652705 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpii6ny8sh`customFunction + 20
; frame #1: [33m0x0000000100003c78[0m tmpii6ny8sh`main + 552
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
; .globl  _customFunction
.align  3
_customFunction:
// Save the link register
stp     lr, x30, [sp, #-16]!

// Multiply int2 by itself
mul     w4, w1, w1

// Store result in *outInt
str     w4, [x2]

// Multiply double1 by itself
fmul    d4, d0, d0

// Store result in *outDouble
str     d4, [x3]

// Restore the link register
ldp     lr, x30, [sp], #16

ret
