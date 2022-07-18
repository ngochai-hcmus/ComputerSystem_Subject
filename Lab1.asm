.data
num: .word 0x12345678
x: .word 0x70
y: .word 0x80

.text
.globl main
main:
addi $t0, $zero , 3
lbu $s1, num($t0)
lb $s2, x
lb $s3, y