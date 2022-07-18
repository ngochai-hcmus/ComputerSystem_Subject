.data
msgs: .asciiz "Input string: "
msge: .asciiz "Result string: "
string: .space 256
newline: .asciiz "\n"

.text
.globl main

main:
# print string "Input string: "
li $v0, 4
la $a0, msgs
syscall

# read input string, limit: 255 characters
li $v0, 8
la $a0, string
li $a1, 256
syscall

add $t0, $a0, $0
lb $t4, newline
loop: # know the position end of input string
	lb $t1, ($t0)
	addi $t0, $t0, 1 
	beq $t4, $t1, end
	bne $t1, $zero, loop 
end:
	addi $t0, $t0, -2

swap: # swap start and end, continue...
	lb $t2, ($a0)
	lb $t3, ($t0)
	sb $t2, ($t0)
	sb $t3, ($a0)
	addi $a0, $a0, 1
	addi $t0, $t0, -1
	ble $a0, $t0, swap

# print string "Result string: "
li $v0,  4
la $a0, msge
syscall

# print result string
li $v0, 4 
la $a0, string
syscall

# end program
li $v0, 10
syscall
