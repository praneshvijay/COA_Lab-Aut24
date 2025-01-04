## group 15
## 22CS10013, 22CS10089
## longest increasing continuous subsequence

.data
  numbers: .space 10000
  newLine: .asciiz "\n"
  lengthMsg: .asciiz "Length of longest increasing continuous subsequence: "
  subarrayMsg: .asciiz "\nLongest longest increasing continuous subsequence: "
  space: .asciiz " "
  sizeMsg: .asciiz "Enter the size of the array (max 3000): "
  inputMsg: .asciiz "Enter the elements:\n"
  titleMsg: .asciiz "Longest increasing continuous subsequence\n\n"

.text
main:
  # Print title
  la $a0, titleMsg
  li $v0, 4
  syscall

  # Read array size
  la $a0, sizeMsg
  li $v0, 4
  syscall

  li $v0, 5
  syscall
  move $s0, $v0  # Array size
  mul $s1, $s0, 4  # Array size in bytes

  # Read array elements
  la $a0, inputMsg
  li $v0, 4
  syscall

  li $t0, 0
  
  read_loop:
    bge $t0, $s1, start_processing
    li $v0, 5
    syscall
    sw $v0, numbers($t0)
    add $t0, $t0, 4
    j read_loop

  start_processing:
    li $t0, 4  # Index of current element
    li $s4, 1  # Max length
    li $s5, 0  # Start index of max subarray
    li $s3, 1  # Current subarray length

  process_loop:
    bge $t0, $s1, print_result

    lw $t2, numbers($t0)  # Load the current element
    addi $t1, $t0, -4    # Calculate the address of the previous element
    lw $t3, numbers($t1)  # Load the previous element

    addi $t0, $t0, 4

    # Corrected comparison for increasing subarray
    ble $t2, $t3, new_sub
    addi $s3, $s3, 1

    bgt $s3, $s4, update_max
    j process_loop

  update_max:
    add $s4, $s3, $0
    div $v0, $t0, 4
    sub $v0, $v0, $s3
    move $s5, $v0
    j process_loop

  new_sub:
    li $s3, 1
    j process_loop

  print_result:
    la $a0, lengthMsg
    li $v0, 4
    syscall

    li $v0, 1
    move $a0, $s4
    syscall

    la $a0, newLine
    li $v0, 4
    syscall

    la $a0, subarrayMsg
    li $v0, 4
    syscall

    mul $t0, $s5, 4
    mul $t1, $s4, 4
    add $t1, $t1, $t0

  print_subarray:
    bge $t0, $t1, exit

    lw $a0, numbers($t0)
    li $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    add $t0, $t0, 4
    j print_subarray

  exit:
    li $v0, 10
    syscall
