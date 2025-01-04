#GROUP 15
#SAI SHREE PRADHAN 22CS10089
#B PRANESH VIJAY 22CS10013

#Program to heapify a given array of size 10 and print the output max heap

.data
array: .space 40  # Space for 10 integers (4 bytes each)
n: .word 10  # Size of the array
input: .asciiz "Enter the 10 elements of the array:\n"
space: .asciiz " "
output: .asciiz "Output Max Heap: "

.text
.globl main

main:
    # Print the input prompt
    la $a0, input  # $a0 = address of input string
    li $v0, 4  # syscall for print string
    syscall

    # Read 10 integers from the user
    la $t0, array  # $t0 = address of array
    li $t1, 10  # $t1 = 10 (number of elements)
    li $t2, 0  # $t2 = index

input_loop:
    bge $t2, $t1, end_input  # if index >= 10, exit loop
    li $v0, 5  # syscall for read integer
    syscall
    sw $v0, 0($t0)  # store the input integer in array[index]
    addi $t0, $t0, 4  # move to the next array element
    addi $t2, $t2, 1  # index++
    j input_loop

end_input:
    # Load array size n
    la $t0, n
    lw $t1, 0($t0)  # $t1 = n

    # Calculate startIdx = (n / 2) - 1
    srl $t2, $t1, 1  # $t2 = n / 2
    sub $t2, $t2, 1  # $t2 = (n / 2) - 1

    # Loop from startIdx to 0
loop:
    blt $t2, $zero, end_loop  # if startIdx < 0, exit loop
    move $a0, $t2  # $a0 = i (startIdx)
    move $a1, $t1  # $a1 = n
    la $a2, array  # $a2 = address of array
    jal heapify  # Call heapify(A, n, i)
    sub $t2, $t2, 1  # i--
    j loop

end_loop:
    # Print the heapified array
    la $t3, array  # $t3 = address of array
    li $t4, 0  # $t4 = index
    la $a0, output  # $a0 = address of output
    li $v0, 4  # syscall for print string
    syscall

print_loop:
    bge $t4, $t1, end_print  # if index >= n, exit loop
    sll $t5, $t4, 2  # $t5 = index * 4 (word size)
    add $t5, $t5, $t3  # $t5 = address of array[index]
    lw $a0, 0($t5)  # $a0 = array[index]
    li $v0, 1  # syscall for print integer
    syscall
    la $a0, space  # $a0 = address of space
    li $v0, 4  # syscall for print string
    syscall
    addi $t4, $t4, 1  # index++
    j print_loop

end_print:
    # Exit program
    li $v0, 10
    syscall

heapify:
    # Function heapify(A, n, i)
    addi $sp, $sp, -16  # Allocate stack space
    sw $ra, 12($sp)  # Save return address
    sw $a0, 0($sp)  # Save i
    sw $a1, 4($sp)  # Save n
    sw $a2, 8($sp)  # Save array address

    move $t3, $a0  # $t3 = i
    move $t4, $a1  # $t4 = n
    move $t5, $a2  # $t5 = array address

    # largest = i
    move $t6, $t3  # $t6 = largest

    # l = 2 * i + 1
    sll $t7, $t3, 1  # $t7 = 2 * i
    addi $t7, $t7, 1  # $t7 = 2 * i + 1

    # r = 2 * i + 2
    sll $t8, $t3, 1  # $t8 = 2 * i
    addi $t8, $t8, 2  # $t8 = 2 * i + 2

    # if l < n and A[l] > A[largest]
    bge $t7, $t4, check_right  # if l >= n, skip
    sll $t9, $t7, 2  # $t9 = l * 4 (word size)
    add $t9, $t9, $t5  # $t9 = address of A[l]
    lw $t9, 0($t9)  # $t9 = A[l]
    sll $s0, $t6, 2  # $t10 = largest * 4
    add $s0, $s0, $t5  # $t10 = address of A[largest]
    lw $s0, 0($s0)  # $t10 = A[largest]
    ble $t9, $s0, check_right  # if A[l] <= A[largest], skip
    move $t6, $t7  # largest = l

check_right:
    # if r < n and A[r] > A[largest]
    bge $t8, $t4, check_swap  # if r >= n, skip
    sll $t9, $t8, 2  # $t9 = r * 4 (word size)
    add $t9, $t9, $t5  # $t9 = address of A[r]
    lw $t9, 0($t9)  # $t9 = A[r]
    sll $s0, $t6, 2  # $t10 = largest * 4
    add $s0, $s0, $t5  # $t10 = address of A[largest]
    lw $s0, 0($s0)  # $t10 = A[largest]
    ble $t9, $s0, check_swap  # if A[r] <= A[largest], skip
    move $t6, $t8  # largest = r

check_swap:
    # if largest != i
    beq $t6, $t3, end_heapify  # if largest == i, skip
    # Swap A[i] and A[largest]
    sll $t9, $t3, 2  
    add $t9, $t9, $t5  
    lw $s0, 0($t9)  
    sll $s1, $t6, 2  
    add $s1, $s1, $t5  
    lw $s2, 0($s1)  # $t12 = A[largest]
    sw $s2, 0($t9)  # A[i] = A[largest]
    sw $s0, 0($s1)  # A[largest] = A[i]

    # Recursively call heapify
    move $a0, $t6  # $a0 = largest
    move $a1, $t4  # $a1 = n
    move $a2, $t5  # $a2 = array address
    jal heapify

end_heapify:
    # restore saved registers and return
    lw $ra, 12($sp) # return address
    lw $a0, 0($sp)  # i
    lw $a1, 4($sp)  # n
    lw $a2, 8($sp)  # array address
    addi $sp, $sp, 16  # deallocate stack space
    jr $ra  # return