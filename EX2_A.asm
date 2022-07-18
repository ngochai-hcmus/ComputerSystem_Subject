.text
.globl main
main:

li $v0, 5
syscall

add $t0, $0, $v0
slti $t1, $t0, 1
addi $s0, $0, 1
bne  $t1, $s0, L
j Exit
L:
addi $t2, $0, 0
Loop:
addi $t2, $t2, 1
add $s1, $s1, $t2
bne $t2, $t0, Loop
j Exit
Exit:

add $a0, $0, $s1
li $v0, 1
syscall
