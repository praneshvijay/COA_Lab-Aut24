# 22CS10089 
# Sai Shree Pradhan
# group 15
# Assumptions: the entered numbers are always greater than 0

.data
prompt: .asciiz "Enter two numbers: "
gcd_msg: .asciiz "The GCD of "
and_msg: .asciiz " and "
is_msg: .asciiz " is "
newline: .asciiz "\n"
prime_msg: .asciiz "The GCD value is a prime\n"
not_prime_msg: .asciiz "The GCD value is not a prime\n"

.text
main:
# print the string to prompt the user to enter two numbers
li $v0, 4
la $a0, prompt
syscall

# read the first number entered by user
li $v0, 5
syscall

# store the first number in $s0
move $s0, $v0

# read the second number entered by user
li $v0, 5
syscall

# store the second number in $s1
move $s1, $v0

# move the numbers to pass them as arguments to the function gcd
move $a0, $s0
move $a1, $s1
# call the gcd function
jal gcd
# store the answer of gcd in $s2
move $s2, $v0

# print the gcd of the two numbers
li $v0, 4
la $a0, gcd_msg
syscall
li $v0, 1
move $a0, $s0
syscall 
li $v0, 4
la $a0, and_msg
syscall
li $v0, 1
move $a0, $s1
syscall
li $v0, 4
la $a0, is_msg
syscall
li $v0, 1
move $a0, $s2
syscall
li $v0, 4
la $a0, newline
syscall

# pass the gcd of the numbers as an argument to the check_prime function
move $a0, $s2
# call the check prime function
jal check_prime

#exit the program
j exit

# gcd function: long division method to find gcd
gcd:
addi $sp, $sp, -4 # use stack pointer to store space for return address
sw $ra, 0($sp) # store the return address
move $t0, $a0 # store first argument in $t0, call it a
move $t1, $a1 # store second argument in $t1, call if b

beq $t0, $t1, gcd_return # if a==b, gcd=a
bgt $t0, $t1, greater # if a>b, swap and compute
rem $t2, $t1, $t0 # c=a%b
beqz $t2, gcd_return # if c==0, a is the gcd
move $a0, $t2 # a=remainder
move $a1, $t0 # b=divisor
jal gcd # call gcd with new arguments
j gcd_return # return from gcd function

greater:
rem $t2, $t0, $t1 # c=b%a, since we need to swap
beqz $t2, gcd_return1 # if c==0, a is the gcd
move $a0, $t2 # a=remainder
move $a1, $t1 # b=divisor
jal gcd # call gcd with new arguments
j gcd_return # return from gcd function

gcd_return:
move $v0, $t0 # store the answer in $v0 to return it
lw $ra, 0($sp) # store return address in $ra
addi $sp, $sp, 4 # free stack pointer space
jr $ra # return

gcd_return1:
move $v0, $t1 # store the answer in $v0 to return it
lw $ra, 0($sp) # store return address in $ra
addi $sp, $sp, 4 # free stack pointer space
jr $ra # return

# logic: prime numbers have only two factors
check_prime:
move $t0, $a0 # store the argument in $t0, call it x
li $t1, 1 # $t1=1
beq $t0, $t1, not_prime # if x==1, the number is not prime
li $t2, 2 # $t2=2
li $t3, 2 # $t3=2, counter starts with 2, since we know every number is divisible by 1, increments until x-1
li $t4, 2 # $t4=4, (call it n) number of factors, starts with 2 since every number is divisible by 1 and itself
j check_prime_loop # go into the loop to find number of factors of x

check_prime_loop:
beq $t3, $t0, prime # if counter has already reached x, and n<=2, it is prime
bgt $t4, $t2, not_prime # if n>2, x is not prime
rem $t5, $t0, $t3 # r=x%counter
beqz $t5, add_factor # if r==0, counter is a factor of x, hence increment n by 1
addi $t3, $t3, 1 # increment the counter by 1
j check_prime_loop # go to next loop

add_factor:
addi $t4, $t4, 1 # n++
addi $t3, $t3, 1 # counter++
j check_prime_loop # next loop

prime:
# print the string that says the number is prime
li $v0,4
la $a0, prime_msg
syscall
jr $ra # return

not_prime:
# print the string that says the number is not prime
li $v0,4
la $a0, not_prime_msg
syscall
jr $ra # return 

# exit program
exit:
li $v0, 10
syscall