## group 15
## 22CS10013, 22CS10089

## Takes in a positive integer - num and divide it by 225
## n = 256q+r = 255q + (q+r)
.data
msg:	.asciiz  "Enter a positive number\n"
q:	.asciiz  "Quotient: "
r:	.asciiz  "Remainder: "
newline:	.asciiz  "\n"
ermsg:		.asciiz  "Entered number was not positive. Exiting.\n"

.text

main:
li	$v0, 4		#loads print syscall command
la	$a0, msg	#loads address of entering msg in $a0
syscall			#makes a syscall
li	$v0, 5		#loads read int syscall command
syscall			#makes a syscall command
move	$t0, $v0	#store the value in $t0
#ble	$t0, 0, error   #if num<0 show error
li	$t4, 0		

loop:
beq $t0, 255, label	#if remainder is 255, go to label
ble $t0, 254, exit	#if remainder is less than 255, it's done
srl $t1, $t0, 8		#$t0 divided by 256, stores q in $t1	
add $t4, $t4, $t1	#add q to the quotient	
sll $t2, $t1, 8		#find 256q, store in $t2
sub $t3, $t0, $t2	#find r using n-256q, store in $t3
add $t0, $t3, $t1	#q+r, use as new n if it's >=255, continue loop	
b loop

label:
addi $t4, $t4, 1	#since remainder was 255, add 1 to quotient 
li $t0, 0		#and change remainder to 0
b exit

error:
li	$v0, 4		#loads print syscall command
la	$a0, ermsg	#loads address of entering ermsg in $a0
syscall			#makes a syscall
li $v0, 10		# load exit command into $v0
syscall			#makes a syscall


exit:	
li	$v0, 4		#loads print syscall command
la	$a0, q		#loads address of entering q in $a0
syscall			#makes a syscall
move $a0, $t4		#store the value of $t1, the quotient in $a0
li $v0, 1		#print the integer in $a0
syscall			#makes a syscall

li	$v0, 4		#loads print syscall command
la	$a0, newline	#loads address of entering newline in $a0
syscall			#makes a syscall
li	$v0, 4		#loads print syscall command
la	$a0, r		#loads address of entering r in $a0
syscall			#makes a syscall
move $a0, $t0		#store the value of $t0, the remainder in $a0
li $v0, 1		#print the integer in $a0
syscall			#makes a syscall

li $v0, 10		# load exit command into $v0
syscall			#makes a syscall

