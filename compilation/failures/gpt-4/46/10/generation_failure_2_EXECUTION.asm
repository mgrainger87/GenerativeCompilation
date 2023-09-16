; compiler_errors=1,linker_errors=0,execution_errors=1,correctness_errors=0
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
; x5 = 0x000000016fdff960
; x6 = 0x000000000000000a
; x7 = 0x0000000000000190
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
; w5 = 0x6fdff960
; w6 = 0x0000000a
; w7 = 0x00000190
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
; s4 = -1.03642435E-16
; s5 = -5.26804326E+9
; s6 = -5.70517561E+37
; s7 = -5.62918298E+9
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
; s20 = -1.03642435E-16
; s21 = -5.26804326E+9
; s22 = -5.46631117E-40
; s23 = 3.89014368E-32
; s24 = -1.19746413E-24
; s25 = -3.14614403E-18
; s26 = -3.20020231E-17
; s27 = 2.81504594E+35
; s28 = 4.21689506E-12
; s29 = 22213.5605
; s30 = -1.63193032E+30
; s31 = 0
; d0 = 0
; d1 = 0.5
; d2 = 0
; d3 = 7.9499288951273625E-275
; d4 = 2.9406248889744966E+234
; d5 = 3.2290445042955088E-269
; d6 = 1.9196723006326267E-76
; d7 = -2.1588451370413479E+258
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
; d20 = 2.9406248889744966E+234
; d21 = 3.2290445042955088E-269
; d22 = -2.3671717262177896E+201
; d23 = -9.5765033829545099E-123
; d24 = -2.9820127228519866E+57
; d25 = -1.0039139149008177E+68
; d26 = -2.8337309136742723E+208
; d27 = 9.4398714059934391E-22
; d28 = 2.4009031119403793E+131
; d29 = 6.0230995964373268E-218
; d30 = -3.1959695221656534E-281
; d31 = 0
; far = 0x00000001ac2e6794
; esr = 0x9a000000
; exception = 0x00000000
; Thread 1 Stop Reason: EXC_BAD_ACCESS (code=259, address=0x16fdff958)
; Thread 15918118 Backtrace:
; frame #0: [33m0x0000000100003960[0m tmp5flk7ol2`customFunction + 16
; frame #1: [33m0x0000000100003c74[0m tmp5flk7ol2`main + 552
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
