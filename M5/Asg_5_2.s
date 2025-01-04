# Assignment #5
# Problem #2
# Semester: Autumn 2024
# Group: 15
# Member1: Pranesh Vijay - 22CS10013
# Member2: Sai Shree Pradhan - 22CS10089


.data
array: .space 1024 # Reserve space for 256 integers 
prompt_rows: .asciiz "Enter the number of rows: " #must be >=1
prompt_cols: .asciiz "Enter the number of columns: " #must be >=1
prompt_a: .asciiz "Enter a: "
prompt_b: .asciiz "Enter b: "
space: .asciiz " "
nline: .asciiz "\n"
print_matrix: .asciiz "The matrix is: \n"
print_tran: .asciiz "The transpose of the matrix is: \n"

.text
main:
    li $v0, 4
    la $a0, prompt_rows
    syscall

    li $v0, 5
    syscall

    #store number of rows in $s0
    move $s0, $v0

    li $v0, 4
    la $a0, prompt_cols
    syscall

    li $v0, 5
    syscall

    #store number of columns in $s1
    move $s1, $v0

    li $v0, 4
    la $a0, prompt_a
    syscall

    li $v0, 5
    syscall

    #store a in $s2
    move $s2, $v0

    li $v0, 4
    la $a0, prompt_b
    syscall

    li $v0, 5
    syscall

    #store b in $s3
    move $s3, $v0

    mul $s4, $s0, $s1 #total number of elements in matrix (must be <=256)
    li $s5, 0 #counter for populating array
    la $s6, array #load address of array

populate_array:
    beq $s5, $s4, print_array
    div $s5, $s1 
    mflo $t0 #row number(i) = counter/columns
    mfhi $t1 #column number(j) = counter%columns
    add $t2, $t0, $t1

    #Calculate a^i
    move $a0, $s2
    move $a1, $t0
    jal power

    move $s7, $v0

    #Calculate b^j
    move $a0, $s3
    move $a1, $t1
    jal power

    mul $s7, $s7, $v0

    li $t3, 2
    rem $t4, $t2, $t3
    beq $t4, 1, odd

    sw $s7, 0($s6)
    addi $s5, $s5, 1
    addi $s6, $s6, 4
    j populate_array

odd:
    mul $s7, $s7, -1
    sw $s7, 0($s6)
    addi $s5, $s5, 1
    addi $s6, $s6, 4
    j populate_array

power:
    li $v0, 1
    j power_loop

power_loop:
    beq $a1, $zero, power_return
    mul $v0, $v0, $a0
    addi $a1, $a1, -1
    j power_loop

power_return:
    jr $ra

print_array:
    li $v0, 4
    la $a0, print_matrix
    syscall

    la $s6, array
    li $s5, 0
    j print_array_loop


print_array_loop:
    beq $s5, $s4, print_transpose
    lw $s7, 0($s6)

    li $v0, 1
    move $a0, $s7
    syscall

    li $v0, 4
    la $a0, space
    syscall

    rem $t0, $s5, $s1
    addi $t1, $s1, -1
    beq $t0, $t1, newline

    addi $s5, $s5, 1
    addi $s6, $s6, 4
    j print_array_loop

#Newline after each row
newline:
    li $v0, 4
    la $a0, nline
    syscall

    addi $s5, $s5, 1
    addi $s6, $s6, 4
    j print_array_loop

print_transpose:
    li $v0, 4
    la $a0, print_tran
    syscall

    li $s5, 0
    la $s6, array
    j outer_loop

outer_loop:
    beq $s5, $s1, exit
    move $a0, $s5
    jal inner_loop

    li $v0, 4
    la $a0, nline
    syscall

    addi $s5, $s5, 1
    j outer_loop

inner_loop:
    move $t0, $a0
    j inner_loop_loop

inner_loop_loop:
    bge $t0, $s4, inner_loop_return

    mul $t1, $t0, 4
    add $t1, $t1, $s6
    lw $s7, 0($t1)

    li $v0, 1
    move $a0, $s7
    syscall

    li $v0, 4
    la $a0, space
    syscall

    add $t0, $t0, $s1
    j inner_loop_loop

inner_loop_return:
    jr $ra

exit:
    li $v0, 10
    syscall