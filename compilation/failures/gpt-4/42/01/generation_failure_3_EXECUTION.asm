; compiler_errors=0,linker_errors=0,execution_errors=3,correctness_errors=0
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
; x5 = 0x0000000000000032
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
; lr = 0x0000000100003954
; sp = 0x000000016fdff940
; pc = 0x0000000100003964
; cpsr = 0x80001000
; w0 = 0x00000064
; w1 = 0x00000032
; w2 = 0x6fdff988
; w3 = 0x6fdff980
; w4 = 0x00000032
; w5 = 0x00000032
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
; s4 = 1.71993403E-19
; s5 = 3.80583307E+28
; s6 = -3.39641501E-28
; s7 = 5.1968436E+36
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
; s20 = 1.71993403E-19
; s21 = 3.80583307E+28
; s22 = -2.24136496E+13
; s23 = 3.41858995E-22
; s24 = 1.94444403E+29
; s25 = 5.05532085E-30
; s26 = 55984068
; s27 = 5.33176445E+29
; s28 = 7.38608428E-30
; s29 = -0.720090925
; s30 = -1.09219425E+25
; s31 = 0
; d0 = 0.25
; d1 = 0.5
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = 4.0974826999840356E-194
; d5 = -1.9551015630296849E-183
; d6 = 1.0281392078297199E-232
; d7 = 3.8214291896241055E+211
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
; d20 = 4.0974826999840356E-194
; d21 = -1.9551015630296849E-183
; d22 = -1.1501561002675741E+222
; d23 = 7.3264281925911487E+182
; d24 = -4.6812846650885469E-41
; d25 = -7.5797417416356398E+51
; d26 = -3.8109513683644238E-236
; d27 = -8.9220557285491862E+24
; d28 = 2.2559939760515481E-24
; d29 = -1.1480705813146997E+139
; d30 = 6.2093683785363569E+18
; d31 = 0
; far = 0x00000001ac2e6794
; esr = 0x02000000
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_INSTRUCTION (code=1, subcode=0xa8c17bfe)
; Thread 15060900 Backtrace:
; frame #0: [33m0x0000000100003964[0m tmpongezyak`customFunction + 24
; frame #1: [33m0x0000000100003c78[0m tmpongezyak`main + 552
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
mov w5, w4                       ; Move the result to w5
str w5, [x2]                     ; Store the result of subtraction in *outInt using w5
ldp lr, x30, [sp], #16           ; Restore lr before returning
ret
