; compiler_errors=0,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program crashed. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=10', 'int2=-5', 'double1=0.5', 'double2=0.3', 'expectedInt=10', 'expectedDouble=0.5']
; Crash detected on thread 1:
; Registers:
; x0 = 0x000000000000000a
; x1 = 0x00000000fffffffb
; x2 = 0x000000016fdff988
; x3 = 0x000000016fdff980
; x4 = 0x000000000000000a
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
; x22 = 0x000000016fdffb20
; x23 = 0x00000001ac1423c6
; x24 = 0x000000016fdffaa0
; x25 = 0x0000000000000001
; x26 = 0x0000000000000000
; x27 = 0x0000000000000000
; x28 = 0x0000000000000000
; fp = 0x000000016fdffa00
; lr = 0x0000000100003c78
; sp = 0x000000016fdff930
; pc = 0x0000000100003964
; cpsr = 0x20001000
; w0 = 0x0000000a
; w1 = 0xfffffffb
; w2 = 0x6fdff988
; w3 = 0x6fdff980
; w4 = 0x0000000a
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
; fpsr = 0x00000010
; fpcr = 0x00000000
; s0 = 0
; s1 = 4.17232506E-8
; s2 = 0
; s3 = 3.82047143E-37
; s4 = 1.74527084E+22
; s5 = 6.16408101E-37
; s6 = -2.24381268E+16
; s7 = -4.39556281E+24
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
; s20 = 1.74527084E+22
; s21 = 6.16408101E-37
; s22 = -2.74151909E-38
; s23 = -7.96270845E-16
; s24 = 2.35219486E-20
; s25 = 1.30293432E+24
; s26 = 3.39234304E+10
; s27 = 0.0157932919
; s28 = -0.308157474
; s29 = 0.00272646407
; s30 = -1.24803315E+36
; s31 = 0
; d0 = 0.5
; d1 = 0.29999999999999999
; d2 = 0.5
; d3 = 7.9499288951273625E-275
; d4 = -2.6938733381989529E-248
; d5 = -3.4961340580247084E+109
; d6 = -1.6492813701071117E+136
; d7 = 1.8818993489240093E+233
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
; d20 = -2.6938733381989529E-248
; d21 = -3.4961340580247084E+109
; d22 = -1.4603555242266199E-304
; d23 = -4.3286660174762316E+259
; d24 = -3.8374822575941177E+272
; d25 = -9.2496049254258228E-24
; d26 = 1.4394142071265353E+131
; d27 = -1.7339823341055051E+187
; d28 = -60.024650408782357
; d29 = -1.6584919680738233E+188
; d30 = 9.6035450754015607E+265
; d31 = 0
; far = 0x00000001ac2e6794
; esr = 0x02000000
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_INSTRUCTION (code=1, subcode=0xa8c27bfe)
; Thread 15247574 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpmmj73x_t`customFunction + 28
; frame #1: [33m0x0000000100003c78[0m tmpmmj73x_t`main + 552
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
.global _customFunction
_customFunction:
// Save link register and align stack
stp     lr, x30, [sp, #-32]!

// *outInt = (int2 < 0) ? int1 : int2;
cmp     w1, #0
csel    w4, w0, w1, lt
str     w4, [x2]

// *outDouble = (double1 > double2) ? double1 : double2;
fcmp    d0, d1
fcsel   d2, d0, d1, gt
str     d2, [x3]

// Restore link register and return
ldp     lr, x30, [sp], #32
ret
