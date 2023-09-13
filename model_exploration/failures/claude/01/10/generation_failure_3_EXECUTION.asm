; compiler_errors=0,linker_errors=0,execution_errors=3,correctness_errors=0
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
; x5 = 0x000000016fdff950
; x6 = 0x000000000000000a
; x7 = 0x0000000000000170
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
; fp = 0x000000016fdff940
; lr = 0x0000000100003c78
; sp = 0x000000016fdff940
; pc = 0x0000000100003954
; cpsr = 0x80001000
; w0 = 0x000003e8
; w1 = 0x00000000
; w2 = 0x6fdff988
; w3 = 0x6fdff980
; w4 = 0x00000000
; w5 = 0x6fdff950
; w6 = 0x0000000a
; w7 = 0x00000170
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
; fpsr = 0x00000000
; fpcr = 0x00000000
; s0 = 0
; s1 = 0
; s2 = 0
; s3 = 3.82047143E-37
; s4 = 1.17402737E-23
; s5 = 2.86550066E-36
; s6 = -1.220681E-9
; s7 = -2.32989491E-20
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
; s20 = 1.17402737E-23
; s21 = 2.86550066E-36
; s22 = 1.52404267E-22
; s23 = 2.51499519E+25
; s24 = 9.21038853E-35
; s25 = 2.88995609E+18
; s26 = -5.98466582E-33
; s27 = 3.70835401E+22
; s28 = 8.56020069
; s29 = -1.53133633E-26
; s30 = -2.43173294E-31
; s31 = 0
; d0 = 1000
; d1 = 0
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = 5.4921525752464745E+78
; d5 = 3.3175030934107312E+81
; d6 = 3.5493475278848877E+58
; d7 = -2.0573122322139941E-250
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
; d20 = 5.4921525752464745E+78
; d21 = 3.3175030934107312E+81
; d22 = 1.0791945383163242E-145
; d23 = -1.0796474594771864E-194
; d24 = -9.4216811917005978E-53
; d25 = -1.5210569047114969E+144
; d26 = -1.2574500055677877E+94
; d27 = 2.4191362484517042E+91
; d28 = 8.0324214708025734E+137
; d29 = 2.8012438571313298E+154
; d30 = 3.0729149991989162E+106
; d31 = 0
; far = 0x0000000000000000
; esr = 0x92000006
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_ACCESS (code=1, address=0x0)
; Thread 13185101 Backtrace:
; frame #0: [33m0x0000000100003954[0m tmpdtebrh5i`customFunction + 8
; frame #1: [33m0x0000000100003c78[0m tmpdtebrh5i`main + 552
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
; .globl  _customFunction
.align  2
_customFunction:
stp     x29, x30, [sp,#-16]!

mov     x29, sp
ldr     x10, [x4]    // load outInt pointer from x4
str     w0, [x10]    // store int1 to outInt

ldr     x11, [x5]    // load outDouble pointer from x5
str     d0, [x11]    // store double1 to outDouble

ldp     x29, x30, [sp],#16
ret
