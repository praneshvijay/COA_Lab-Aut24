.data
array: .space 128  # Reserve space for 32 integers (4 bytes each)
prompt_m: .asciiz "Enter the value of M: "
prompt_n: .asciiz "Enter the value of N: "
prompt_d: .asciiz "Enter the value of d: "
binary_rep: .asciiz "Binary representation of d: "
modexp: .asciiz "The result of M^d mod N is: "
newline: .asciiz "\n"

.text
main:

li $s6, 1 # Set $s6 to 1

li $v0, 4
la $a0, prompt_m
syscall

li $v0, 5
syscall

move $t9, $v0 # Move M to $t1

li $v0, 4
la $a0, prompt_d
syscall

li $v0, 5 
syscall

move $t0, $v0 # Move d to $t0

li $v0, 4
la $a0, prompt_n
syscall

li $v0, 5
syscall

move $t8, $v0 # Move N to $t2

jal DecimalToBinary

la $s0, array       # Load the address of the binary array
addi $s1, $s0, 124   # Set $s1 to point 128 bytes ahead of $s0  

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, binary_rep
syscall

print_loop:
blt $s1, $s0, label  # Exit when $s0 > $s1
lw $s2, 0($s1)       # Load the integer at $s0 into $s2
li $v0, 1            # Syscall code for print integer
move $a0, $s2        # Move the integer to $a0
syscall              # Print the integer
addi $s1, $s1, -4    # Move to the next integer (4 bytes)
j print_loop         # Repeat the loop

label:
li $v0, 4
la $a0, newline
syscall

jal ModExp

exit:
li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, modexp
syscall

li $v0, 1
move $a0, $s6
syscall

li $v0, 10           # Syscall code for exit
syscall              # Exit the program

DecimalToBinary:
addi $sp, $sp, -4
sw $ra, 0($sp)       # Save return address
la $s0, array       # Load the address of the binary array

li $t1, 32           # Set the loop counter to 32

DecimalToBinaryLoop:
beq $t1, $zero, DecimalToBinaryReturn  # Exit loop when counter is zero
andi $t2, $t0, 1     # Get the least significant bit
sw $t2, 0($s0)       # Store the bit in the binary array
srl $t0, $t0, 1      # Shift the integer right by 1 bit
addi $s0, $s0, 4     # Move to the next integer (4 bytes)
addi $t1, $t1, -1    # Decrement the loop counter
j DecimalToBinaryLoop # Repeat the loop

DecimalToBinaryReturn:
lw $ra, 0($sp)       # Restore return address
addi $sp, $sp, 4     # Restore stack pointer
jr $ra              # Return to the calling function

Square:
# Function to square a number
mul $s7, $a0, $a0  # Multiply $a0 by itself and store the result in $v0
rem $v0, $s7, $a1  # Store the remainder of the division in $v0

jr $ra             # Return to the caller

Multiply:
# Function to multiply two numbers
mul $s7, $a0, $a1  # Multiply $a0 by $a1 and store the result in $s0
rem $v0, $s7, $a2  # Store the remainder of the division in $v0

jr $ra 

ModExp:
addi $sp, $sp, -4
sw $ra, 0($sp)       # Save return address
la $s0, array       # Load the address of the binary array
addi $s1, $s0, 128   # Set $s1 to point 128 bytes ahead of $s0

loop:
beq $s1, $s0, exit_mod   # Exit when $s0 > $s1
lw $s2, 0($s0)       # Load the integer at $s0 into $s2
bne $s2, 1, label1

move $a0, $s6
move $a1, $t9
move $a2, $t8
jal Multiply
move $s6, $v0

label1:
move $a0, $t9
move $a1, $t8
jal Square
move $t9, $v0
addi $s0, $s0, 4    # Move to the next integer (4 bytes)

j loop

exit_mod:
lw $ra, 0($sp)       # Restore return address
addi $sp, $sp, 4     # Restore stack pointer
jr $ra              # Return to the calling function
j exit
