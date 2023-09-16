; compiler_errors=1,linker_errors=0,execution_errors=2,correctness_errors=0
; ; Compiler error: None
; ; Linker error: None
; ; Execution error: When executing the assembly provided with the input values below, the program crashed. First, look at the stop reason below. Then, examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. 
; 
; Command-line Arguments: ['int1=10', 'int2=5', 'double1=0', 'double2=0.5', 'expectedInt=50', 'expectedDouble=0.5']
; Crash detected on thread 1:
; Registers:
; x0 = 0x0000000000000032
; x1 = 0x0000000000000005
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
; x19 = 0x0000000100003a4c
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
; lr = 0x0000000100003958
; sp = 0x000000016fdff958
; pc = 0x0000000100003960
; cpsr = 0x80001000
; w0 = 0x00000032
; w1 = 0x00000005
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
; w19 = 0x00003a4c
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
; s4 = -1.62001257E-38
; s5 = -3.39114454E+22
; s6 = -4.00542146E+19
; s7 = -2.36614728E-9
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
; s20 = -1.62001257E-38
; s21 = -3.39114454E+22
; s22 = -1.93458735E-10
; s23 = 587883584
; s24 = 4.19938984E+17
; s25 = 22.1866302
; s26 = -4.94509579E+26
; s27 = -5.10954651E+29
; s28 = 1.32675469E+32
; s29 = -942.765258
; s30 = 4.45691489E+20
; s31 = 0
; d0 = 0
; d1 = 0.5
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = -2.4121859701738249E+243
; d5 = -2.5969242541975907E-223
; d6 = 2.220448389264459E-285
; d7 = -0.000053560410507902568
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
; d20 = -2.4121859701738249E+243
; d21 = -2.5969242541975907E-223
; d22 = 7.0523865372201567E+50
; d23 = 1.0395928393706178E-13
; d24 = 2.7659937248325773E-133
; d25 = 7.9122908478299E-47
; d26 = 1.1363178513505458E-212
; d27 = -3.1290089098123955E+148
; d28 = 1.8986125363072995E+119
; d29 = -4148614691.3653536
; d30 = -2.1556941714116823E+192
; d31 = 0
; far = 0x00000001ac2e6794
; esr = 0x9a000000
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_ACCESS (code=259, address=0x16fdff958)
; Thread 15920114 Backtrace:
; frame #0: [33m0x0000000100003960[0m tmpvho95fr0`customFunction + 16
; frame #1: [33m0x0000000100003c74[0m tmpvho95fr0`main + 552
; frame #2: [33m0x00000001ac0c7f28[0m dyld`start + 2236
; 
; ; Correctness error: None
.global _helperFunction
.align 3

_helperFunction:
// Multiply a and b
mul w0, w0, w1
// Return the result
ret

.global _customFunction
.align 3

_customFunction:
// Save the link register to the stack
str lr, [sp, #-8]!

// Call helperFunction to multiply int1 and int2
bl _helperFunction

// Store the result to the location pointed by outInt
str w0, [x2]

// Store double2 to the location pointed by outDouble
str d1, [x3]

// Restore the link register from the stack
ldr lr, [sp], #8

// Return to the caller
ret
