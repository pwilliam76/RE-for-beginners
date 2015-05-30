include(`commons.m4')main:

; _EN(``IDA is not aware of structure field names, I named them manually'')_RU(``IDA не в курсе имен полей структуры, я назвал их так вручную''):

var_40          = -0x40
var_38          = -0x38
seconds         = -0x34
minutes         = -0x30
hour            = -0x2C
day             = -0x28
month           = -0x24
year            = -0x20
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x50
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x50+var_4($sp)
                sw      $gp, 0x50+var_40($sp)
                lw      $t9, (time & 0xFFFF)($gp)
                or      $at, $zero ; load delay slot, NOP
                jalr    $t9
                move    $a0, $zero ; branch delay slot, NOP
                lw      $gp, 0x50+var_40($sp)
                addiu   $a0, $sp, 0x50+var_38
                lw      $t9, (localtime_r & 0xFFFF)($gp)
                addiu   $a1, $sp, 0x50+seconds
                jalr    $t9
                sw      $v0, 0x50+var_38($sp) ; branch delay slot
                lw      $gp, 0x50+var_40($sp)
                lw      $a1, 0x50+year($sp)
                lw      $t9, (printf & 0xFFFF)($gp)
                la      $a0, $LC0        # "Year: %d\n"
                jalr    $t9
                addiu   $a1, 1900 ; branch delay slot
                lw      $gp, 0x50+var_40($sp)
                lw      $a1, 0x50+month($sp)
                lw      $t9, (printf & 0xFFFF)($gp)
                lui     $a0, ($LC1 >> 16)  # "Month: %d\n"
                jalr    $t9
                la      $a0, ($LC1 & 0xFFFF)  # "Month: %d\n" ; branch delay slot
                lw      $gp, 0x50+var_40($sp)
                lw      $a1, 0x50+day($sp)
                lw      $t9, (printf & 0xFFFF)($gp)
                lui     $a0, ($LC2 >> 16)  # "Day: %d\n"
                jalr    $t9
                la      $a0, ($LC2 & 0xFFFF)  # "Day: %d\n" ; branch delay slot
                lw      $gp, 0x50+var_40($sp)
                lw      $a1, 0x50+hour($sp)
                lw      $t9, (printf & 0xFFFF)($gp)
                lui     $a0, ($LC3 >> 16)  # "Hour: %d\n"
                jalr    $t9
                la      $a0, ($LC3 & 0xFFFF)  # "Hour: %d\n" ; branch delay slot
                lw      $gp, 0x50+var_40($sp)
                lw      $a1, 0x50+minutes($sp)
                lw      $t9, (printf & 0xFFFF)($gp)
                lui     $a0, ($LC4 >> 16)  # "Minutes: %d\n"
                jalr    $t9
                la      $a0, ($LC4 & 0xFFFF)  # "Minutes: %d\n" ; branch delay slot
                lw      $gp, 0x50+var_40($sp)
                lw      $a1, 0x50+seconds($sp)
                lw      $t9, (printf & 0xFFFF)($gp)
                lui     $a0, ($LC5 >> 16)  # "Seconds: %d\n"
                jalr    $t9
                la      $a0, ($LC5 & 0xFFFF)  # "Seconds: %d\n" ; branch delay slot
                lw      $ra, 0x50+var_4($sp)
                or      $at, $zero ; load delay slot, NOP
                jr      $ra
                addiu   $sp, 0x50

$LC0:           .ascii "Year: %d\n"<0>   
$LC1:           .ascii "Month: %d\n"<0>  
$LC2:           .ascii "Day: %d\n"<0>    
$LC3:           .ascii "Hour: %d\n"<0>   
$LC4:           .ascii "Minutes: %d\n"<0>
$LC5:           .ascii "Seconds: %d\n"<0>
