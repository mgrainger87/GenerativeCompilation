//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Compare int1 and int2
cmp w0, w1

// If int1 > int2, jump to the true_label
b.gt true_label

// Else block
// Store int2 into *outInt
str w1, [x2]

// Store double2 into *outDouble
str d1, [x3]
ret

true_label:
// True block
// Store int1 into *outInt
str w0, [x2]

// Store double1 into *outDouble
str d0, [x3]
ret
