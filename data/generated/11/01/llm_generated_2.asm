.global _customFunction

_customFunction:
; Calculate result = (int1 + 5) * (int2 + 3)
add w4, w0, #5          ; w4 = int1 + 5
add w5, w1, #3          ; w5 = int2 + 3
mul w6, w4, w5          ; w6 = w4 * w5

; Store result in memory address pointed by outInt
str w6, [x2]

ret
