.global _customFunction

_customFunction:
; No need to save any callee-saved registers since we're not modifying them.

; temp1 = int1 + 5
add w4, w0, #5         ; w4 = int1 + 5

; temp2 = int2 + 3
add w5, w1, #3         ; w5 = int2 + 3

; result = temp1 * temp2
mul w6, w4, w5         ; w6 = w4 * w5

; store result in memory address pointed by outInt
str w6, [x2]

ret
