; compiler_errors=0,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly you provided with the input values below, the program crashed. Examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=1000', 'int2=0', 'double1=1000.0', 'double2=0.0', 'expectedInt=1000', 'expectedDouble=1000.0', 'iterations=100']
; Crash detected on thread 1:
; Registers:
; x0 = 0x00000000000003e8
; x1 = 0x0000000000000000
; x2 = 0x000000016fdff988
; x3 = 0x000000016fdff980
; x4 = 0x0000000000000000
; x5 = 0x0000000000000003
; x6 = 0x000000000000000a
; x7 = 0x0000000000000000
; x8 = 0x0000000000000000
; x9 = 0x0000000000000064
; x10 = 0x0000000000000000
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
; x22 = 0x000000016fdffb20
; x23 = 0x00000001ac1423c6
; x24 = 0x000000016fdffaa0
; x25 = 0x0000000000000001
; x26 = 0x0000000000000000
; x27 = 0x0000000000000000
; x28 = 0x0000000000000000
; fp = 0x000000016fdff940
; lr = 0x0000000100003c78
; sp = 0x000000016fdff940
; pc = 0x0000000100003958
; cpsr = 0x80001000
; w0 = 0x000003e8
; w1 = 0x00000000
; w2 = 0x6fdff988
; w3 = 0x6fdff980
; w4 = 0x00000000
; w5 = 0x00000003
; w6 = 0x0000000a
; w7 = 0x00000000
; w8 = 0x00000000
; w9 = 0x00000064
; w10 = 0x00000000
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
; w22 = 0x6fdffb20
; w23 = 0xac1423c6
; w24 = 0x6fdffaa0
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
; s4 = 454.161896
; s5 = 6.33587598E-24
; s6 = 1.6886338E+22
; s7 = 3627.45776
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
; s20 = 454.161896
; s21 = 6.33587598E-24
; s22 = 1.25922484E-26
; s23 = -1.84937222E+20
; s24 = 252.113052
; s25 = 1.00770083E+28
; s26 = 3.57647003E-34
; s27 = 9.28789357E+18
; s28 = 5.17149205E-11
; s29 = -1205062
; s30 = 3.47685959E+37
; s31 = 0
; d0 = 1000
; d1 = 0
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = -1.2788719772820614E-86
; d5 = 1.0348649483221573E+184
; d6 = 1.3212133388504124E-197
; d7 = 2.8827514275197892E+108
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
; d20 = -1.2788719772820614E-86
; d21 = 1.0348649483221573E+184
; d22 = 5.6925852675681911E+145
; d23 = 3.625697297644382E-130
; d24 = 1.5536206940470527E+81
; d25 = -2.1393084138842661E+147
; d26 = 2.2052948559134448E+238
; d27 = -2.9631900179408744E-280
; d28 = 1.2086317193585107E+92
; d29 = 1.1367107283998277E+90
; d30 = -7.6279771659020527E+94
; d31 = 0
; far = 0x0000000000000000
; esr = 0x92000046
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_ACCESS (code=1, address=0x0)
; Thread 13184574 Backtrace:
; frame #0: [33m0x0000000100003958[0m tmpj82pp1r6`customFunction + 12
; frame #1: [33m0x0000000100003c78[0m tmpj82pp1r6`main + 552
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
; .globl  _customFunction
.align  2
_customFunction:
stp     x29, x30, [sp,#-16]!
mov     x29, sp
mov     x10, x4       // load outInt pointer
str     w0, [x10]     // store int1 to outInt

mov     x11, x5       // load outDouble pointer
str     d0, [x11]     // store double1 to outDouble

ldp     x29, x30, [sp],#16
ret
