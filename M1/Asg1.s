## Takes in a positive integer - num and prints out its prime factors
## Registers Used :
## $t0 for storing num
## $t1 for storing k
## $t2 for storing remainder
##
.data
msg:	.asciiz  "Enter a positive number\n"
space: .asciiz " "

.text

main:
li	$v0, 4		#loads print syscall command
la	$a0, msg	#loads address of entering msg in $a0
syscall			#makes a syscall
li	$v0, 5		#loads read int syscall command
syscall			#makes a syscall command
move	$t0, $v0	#store the value in $t0
li	$t1, 2		#initialize k with 2

loop:
ble $t0 , 1 , exit	#if num<=1 exit loop
rem $t2, $t0, $t1	#loads num%k into $t2
beq $t2, $zero, print	#if remainder is 0 print the factor
addi $t1, $t1, 1	#add 1 to k
b loop			#unconditional branching to loop

print:
move $a0, $t1		#store the value of $t1 in $a0
li $v0, 1		#print the integer in $a0
syscall			#makes a syscall

li $v0, 4		#loads print syscall command 
la $a0, space		#loads address of entering space in $a0
syscall			#makes a syscall

div $t0, $t0, $t1	#loads the quotient of num/k into $t0
bne $t0, $zero, loop	#if num is 0 exit
b exit

exit:	
li $v0, 10		# load exit command into $v0
syscall			#makes a syscall
