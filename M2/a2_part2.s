## group 15
## 22CS10013, 22CS10089
## find Kth largest and Kth smallest element in given array with n elements
## K is 0 indexed
## assumption: size of array is 10

.data
array: .word 80, 103, 1, 5, 8, 11, 3, 7, 66, 0		
msg: .asciiz "Enter non-negative number less than 10: "
nl:	.asciiz  "\n"
ss: .asciiz "Kth smallest: "
lrg: .asciiz "Kth largest: "

.text
main:
la $s7, array			#load address of numbers into $s7

li $s0, 0			#initialize counter 1 for loop 1
li $s6, 9			#n - 1, change this if size of array is changed
	
li $s1, 0			#initialize counter 2 for loop 2

li $v0, 4			#loads print syscall command					
la $a0, msg			#loads address of entering msg in $a0
syscall				#makes a syscall
	
li $v0, 5			#loads read int syscall command
syscall				#makes a syscall command
move $t8, $v0			#store the value in $t8=K
	
loop:
sll $t7, $s1, 2			#multiply $s1 by 2 and put it in t7
add $t7, $s7, $t7 		#add the address of numbers to t7

lw $t0, 0($t7)  		#load numbers[j]	
lw $t1, 4($t7) 			#load numbers[j+1]

slt $t2, $t0, $t1		#if t0 < t1
bne $t2, $zero, increment

sw $t1, 0($t7) 			#swap
sw $t0, 4($t7)

increment:	

addi $s1, $s1, 1		#increment t1
sub $s5, $s6, $s0 		#subtract s0 from s6

bne  $s1, $s5, loop		#if s1 (counter for second loop) does not equal 9, loop
addi $s0, $s0, 1 		#otherwise add 1 to s0
li $s1, 0 			#reset s1 to 0

bne  $s0, $s6, loop		# go back through loop with s1 = s1 + 1

final:	

li $v0, 4			#loads print syscall command					
la $a0, ss			#loads address of entering ss in $a0		
syscall				#makes a syscall
	
la $s7, array			#load address of numbers into $s7	
mul $s2, $t8, 4			#multiply 4 to k, since each int is 4 bytes
add $s3, $s7, $s2		#add it to the address of 0th element to find Kth element
lw $t9, 0($s3)			#load Kth element in $t9
move $a0, $t9			#store the value of $t9, the quotient in $a0		
li $v0, 1			#print the integer in $a0		
syscall				#makes a syscall

li $v0, 4			#loads print syscall command											
la $a0, nl			#loads address of entering nl in $a0
syscall				#makes a syscall
	
li $v0, 4			#loads print syscall command					
la $a0, lrg			#loads address of entering lrg in $a0
syscall				#makes a syscall
	
li $s4, 9			#n-1, change if size of array is changed
sub $s1, $s4, $t8		#Kth from behind, n-1-K
mul $s2, $s1, 4			#multiply 4 to position from beginning, since each int is 4 bytes
add $s3, $s7, $s2		#add it to the address of 0th element to find Kth element from behind		
lw $t9, 0($s3)			#load Kth element from the end in $t9
move $a0, $t9			#store the value of $t9, the quotient in $a0		
li $v0, 1			#print the integer in $a0		
syscall				#makes a syscall	

li $v0, 10			#load exit command into $v0					
syscall				#makes a syscall