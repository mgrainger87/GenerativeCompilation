Compiler error: NoneLinker error: NoneExcecution error: Command-line Arguments: ['int1=1000', 'int2=0', 'double1=1000.0', 'double2=0.0', 'expectedInt=1000', 'expectedDouble=1000.0', 'iterations=100']
Crash detected on thread 1:
Registers:
x0 = 0x00000000000003e8
x1 = 0x0000000000000000
x2 = 0x000000016fdff988
x3 = 0x000000016fdff980
x4 = 0x0000000000000000
x5 = 0x0000000000000003
x6 = 0x000000000000000a
x7 = 0x0000000000000000
x8 = 0x0000000000000000
x9 = 0x0000000000000064
x10 = 0x0000000000000002
x11 = 0x00000000fffffffd
x12 = 0x0000010000000000
x13 = 0x0000000000000000
x14 = 0x0000000000000000
x15 = 0x0000000000000000
x16 = 0x00000001ac3e092c
x17 = 0x000000020bfc7298
x18 = 0x0000000000000000
x19 = 0x0000000100003a50
x20 = 0x000000010000c000
x21 = 0x000000010000d910
x22 = 0x000000016fdffb20
x23 = 0x00000001ac1423c6
x24 = 0x000000016fdffaa0
x25 = 0x0000000000000001
x26 = 0x0000000000000000
x27 = 0x0000000000000000
x28 = 0x0000000000000000
fp = 0x000000016fdff940
lr = 0x0000000100003c78
sp = 0x000000016fdff940
pc = 0x0000000100003954
cpsr = 0x80001000
w0 = 0x000003e8
w1 = 0x00000000
w2 = 0x6fdff988
w3 = 0x6fdff980
w4 = 0x00000000
w5 = 0x00000003
w6 = 0x0000000a
w7 = 0x00000000
w8 = 0x00000000
w9 = 0x00000064
w10 = 0x00000002
w11 = 0xfffffffd
w12 = 0x00000000
w13 = 0x00000000
w14 = 0x00000000
w15 = 0x00000000
w16 = 0xac3e092c
w17 = 0x0bfc7298
w18 = 0x00000000
w19 = 0x00003a50
w20 = 0x0000c000
w21 = 0x0000d910
w22 = 0x6fdffb20
w23 = 0xac1423c6
w24 = 0x6fdffaa0
w25 = 0x00000001
w26 = 0x00000000
w27 = 0x00000000
w28 = 0x00000000
v0 = None
v1 = None
v2 = None
v3 = None
v4 = None
v5 = None
v6 = None
v7 = None
v8 = None
v9 = None
v10 = None
v11 = None
v12 = None
v13 = None
v14 = None
v15 = None
v16 = None
v17 = None
v18 = None
v19 = None
v20 = None
v21 = None
v22 = None
v23 = None
v24 = None
v25 = None
v26 = None
v27 = None
v28 = None
v29 = None
v30 = None
v31 = None
fpsr = 0x00000000
fpcr = 0x00000000
s0 = 0
s1 = 0
s2 = 0
s3 = 3.82047143E-37
s4 = 1.55820608
s5 = -3.17831867E-32
s6 = -9.23022975E+23
s7 = -1.38044204E+34
s8 = 0
s9 = 0
s10 = 0
s11 = 0
s12 = 0
s13 = 0
s14 = 0
s15 = 0
s16 = 1.40129846E-45
s17 = 2.80259693E-45
s18 = 1.08664755E-31
s19 = 0
s20 = 1.55820608
s21 = -3.17831867E-32
s22 = -1.69136338E+31
s23 = -1.23836535E+30
s24 = -1.95738435E-16
s25 = -2.512332E+33
s26 = 2.257066E-8
s27 = 5.44417993E+20
s28 = 6.2532348E-18
s29 = -1.32268239E+25
s30 = -1328968.75
s31 = 0
d0 = 1000
d1 = 0
d2 = 0
d3 = 7.9499288951273625E-275
d4 = 7.9105972048662682E+17
d5 = 2.8200216416095887E+187
d6 = -5.4353878397621236E+262
d7 = 2.5704409978500843E-227
d8 = 0
d9 = 0
d10 = 0
d11 = 0
d12 = 0
d13 = 0
d14 = 0
d15 = 0
d16 = 4.9406564584124654E-324
d17 = 9.8813129168249309E-324
d18 = 5.9245434102707407E-270
d19 = 0
d20 = 7.9105972048662682E+17
d21 = 2.8200216416095887E+187
d22 = -6.1968569335830926E-196
d23 = -4.4614990147050785E-216
d24 = -1.7250819844341531E-134
d25 = 2.5703757560009691E+147
d26 = -1.7727451967755101E+223
d27 = 2.4208918993111706E+85
d28 = -1280836775531.2583
d29 = -8.6581212422952014E-192
d30 = 3.6877665730591506E+99
d31 = 0
far = 0x00000000000003e8
esr = 0x92000006
exception = 0x00000000
Thread 1 Stop Reason: EXC_BAD_ACCESS (code=1, address=0x3e8)
Thread 12563675 Backtrace:
frame #0: [33m0x0000000100003954[0m tmpinlb68zl`customFunction + 8
frame #1: [33m0x0000000100003c78[0m tmpinlb68zl`main + 552
frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
Correctness error: None.global _customFunction
.p2align 2
_customFunction:
stp x29, x30, [sp,#-16]!
mov x29, sp
ldr w0, [x0]
str w0, [x3]

ldr d0, [x2]
str d0, [x4]

ldp x29, x30, [sp],#16
ret