# Assignment #5
# Problem #1
# Semester: Autumn 2024
# Group: 15
# Member1: Pranesh Vijay - 22CS10013
# Member2: Sai Shree Pradhan - 22CS10089

.data
str: .space 100     # input string
stack: .space 100   # stack
rstr: .space 100    # reversed string
iprompt: 
    .asciiz "Enter the string: "
oprompt: 
    .asciiz "Reversed String: "

.text
main:
    li $v0, 4
    la $a0, iprompt
    syscall

    # read string
    li $v0, 8
    la $a0, str
    li $a1, 100
    syscall

    li $s1, 0   # top of stack
    li $t0, 0   # index of str

# loop to push characters into stack
loop:
    lb $t1, str($t0)
    beq $t1, 0, reverse
    move $a0, $t1
    jal push
    addi $t0, $t0, 1
    j loop

#Push Function
push:
    sb $a0, stack($s1)
    addi $s1, $s1, 1
    jr $ra


reverse:
    li $s0, 0   # index of rstr
    sub $s1, $s1, 2

#loop to pop characters from stack
rloop:
    blt $s1, 0, exit
    jal pop
    j rloop
    
#Pop Function
pop:
    lb $t1, stack($s1)
    sb $t1, rstr($s0)
    addi $s0, $s0, 1
    addi $s1, $s1, -1
    jr $ra

exit:
    li $v0, 4
    la $a0, oprompt
    syscall

    # print reversed string
    li $v0, 4
    la $a0, rstr
    syscall

    li $v0, 10
    syscall

