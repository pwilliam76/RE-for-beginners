include(`commons.m4')f:
; $a0=a
                ori     $a0, 0x4000
; $a0=a|0x4000
                li      $v0, 0xFFFFFDFF
                jr      $ra
                and     $v0, $a0, $v0
; _EN(`at finish')_RU(`на выходе'): $v0 = $a0&$v0 = a|0x4000 & 0xFFFFFDFF
