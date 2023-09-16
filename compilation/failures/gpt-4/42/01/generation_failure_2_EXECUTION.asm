; compiler_errors=0,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program crashed. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=100', 'int2=50', 'double1=0.5', 'double2=0.5', 'expectedInt=50', 'expectedDouble=0.25']
; Crash detected on thread 1:
; Registers:
; x0 = 0x0000000000000064
; x1 = 0x0000000000000032
; x2 = 0x000000016fdff988
; x3 = 0x000000016fdff980
; x4 = 0x0000000000000032
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
; lr = 0x0000000100003958
; sp = 0x000000016fdff940
; pc = 0x0000000100003964
; cpsr = 0x80001000
; w0 = 0x00000064
; w1 = 0x00000032
; w2 = 0x6fdff988
; w3 = 0x6fdff980
; w4 = 0x00000032
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
; fpsr = 0x00000000
; fpcr = 0x00000000
; s0 = 0
; s1 = 0
; s2 = 0
; s3 = 3.82047143E-37
; s4 = -1.57520863E+19
; s5 = 7.01795325E-14
; s6 = -1.25106452E+24
; s7 = -2.28480033E-26
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
; s20 = -1.57520863E+19
; s21 = 7.01795325E-14
; s22 = -4.84588216E-33
; s23 = -7.06008865E-15
; s24 = 6.73233142E+10
; s25 = -3.36666614E+33
; s26 = -3.93228607E+36
; s27 = -1.68895488E-11
; s28 = -4.18980851E+21
; s29 = 8.80502861E-15
; s30 = -2.96216245E-37
; s31 = 0
; d0 = 0.25
; d1 = 0.5
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = -9.9591154690100805E+176
; d5 = -1.0464973524986582E-257
; d6 = -3.5998779306832706E-225
; d7 = -2.3643767749417992E-17
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
; d20 = -9.9591154690100805E+176
; d21 = -1.0464973524986582E-257
; d22 = -2.5173820263319076E+271
; d23 = 4.6215988191422066E-7
; d24 = -2.9047401095768118E+237
; d25 = -4.5212048697933206E-123
; d26 = -1.994286471409079E-71
; d27 = -1.2412382527670684E-274
; d28 = 6.2397922026294241E-167
; d29 = -1.795145289211264E+103
; d30 = -4.7161215799956233E+142
; d31 = 0
; far = 0x00000001ac2e6794
; esr = 0x02000000
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_INSTRUCTION (code=1, subcode=0xa8c17bfe)
; Thread 15059157 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpqirjzt1w`customFunction + 20
; frame #1: [33m0x0000000100003c78[0m tmpqirjzt1w`main + 552
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
.global _helperFunction
_helperFunction:
// Multiply the two floating point values and return the result.
fmul d0, d0, d1
ret
.global _customFunction
_customFunction:
stp lr, x30, [sp, #-16]!          ; Store lr (link register) as we're going to call another function
bl _helperFunction                ; Call helperFunction(double1, double2) - results in d0
str d0, [x3]                     ; Store the result of the multiplication in *outDouble
sub w4, w0, w1                   ; Subtract int2 from int1 and store in w4
str w4, [x2]                     ; Store the result of subtraction in *outInt
ldp lr, x30, [sp], #16           ; Restore lr before returning
ret
