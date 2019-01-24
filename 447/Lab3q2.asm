.data
a: .word 0x7a7b7c7d
.text
la $t0 a
lb $t1,1($t0)
mul  $t1,$t1,$t1  
