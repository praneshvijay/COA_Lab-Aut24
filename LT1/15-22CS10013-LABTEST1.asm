#NAME: B PRANESH VIJAY
#ROLL NO: 22CS10013
#GROUP NO: 15
#LAB TEST 1

.data
ipr:	.asciiz "Enter two numbers: \n"		
gcpr1:	.asciiz "The GCD of "
gcpr2:	.asciiz " and "
gcpr3:	.asciiz " is "
prmpr1:	.asciiz "The GCD value is a prime\n"
prmpr2:	.asciiz "The GCD value is not a prime\n"
space:		.asciiz " "
newline:	.asciiz "\n"


.text

#Program Variables
#Inputs: a, b
#a = $s0
#b = $s1
#gcd(a, b) = $s2

main:
	li $v0, 4
	la $a0, ipr 
	syscall

	li $v0,5
	syscall

	move $s0,$v0
	
	li $v0,5
	syscall

	move $s1,$v0

	li $v0, 4
	la $a0, gcpr1
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 4
	la $a0, gcpr2 
	syscall

	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, gcpr3 
	syscall
	
	#Swap a and b to always have a > b before calling gcd
	jal swap

	#Call GCD function with arguments a and b
	move $a0, $s0
	move $a1, $s1
	jal gcd

	#Store the GCD in $s2
	move $s2, $v0

	#Print the GCD
	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 4
	la $a0, newline 
	syscall

	#Call the function PRIME with argument gcd(a, b)	
	move $a0, $s2
	jal prime
	
	j exit

swap:
	move $t0, $s0
	move $t1, $s1

	blt $t0, $t1, swapab
	jr $ra
swapab:
	move $t2, $s0
	move $s0, $s1
	move $s1, $t2

	jr $ra

#GCD function
gcd:	
	move $t0, $a0
	move $t1, $a1

gcdloop:
	beqz $t1, gcdret
	rem $t2, $t0, $t1
	move $t0, $t1
	move $t1, $t2
	j gcdloop

gcdret:
	move $v0, $t0
	jr $ra

#PRIME function
prime:
	move $t0, $a0
	li $t1, 2
	blt $t0, $t1, nprret

loop:
	mul $t2, $t1, $t1
	bgt $t2, $t0, prret
	rem $t3, $t0, $t1
	beqz $t3, nprret
	addi, $t1, $t1, 1
	j loop

prret:
	li $v0, 4
	la $a0, prmpr1
	syscall
	
	jr $ra

nprret:
	li $v0, 4
	la $a0, prmpr2 
	syscall

	jr $ra

exit:
	li $v0,10
	syscall