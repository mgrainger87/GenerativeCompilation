.global _customFunction

_customFunction:
; We don't need to save any callee-saved registers since we're not modifying them.

; temp1 = int1 + 10 - 5
; x0 already contains int1
add w4, w0, #10        ; w4 = int1 + 10
sub w4, w4, #5         ; w4 = int1 + 10 - 5

; temp2 = int2 + 5 - 2
; x1 already contains int2
add w5, w1, #5         ; w5 = int2 + 5
sub w5, w5, #2         ; w5 = int2 + 5 - 2

; result = temp1 * temp2
mul w6, w4, w5         ; w6 = w4 * w5

; store result in memory address pointed by outInt
str w6, [x2]

ret
