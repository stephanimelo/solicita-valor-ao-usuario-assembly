.data

msg_numero: .asciiz "Digite um número: "
msg_resultado: .asciiz "O resultado da operação é: "

numero: .word 0
resultado: .word 0

.text
.globl main

main:
    
    li $v0, 4
    la $a0, msg_numero
    syscall
    li $v0, 5
    syscall
    sw $v0, numero

    
    lw $t0, numero

   
    andi $t1, $t0, 1 
    beq $t1, $zero, eh_par  
    j eh_impar  

eh_par:
   
    addi $t2, $t0, 5
    sw $t2, resultado
    j imprimir_resultado

eh_impar:

    addi $t2, $t0, 8
    sw $t2, resultado
imprimir_resultado:
  
    li $v0, 4
    la $a0, msg_resultado
    syscall
    lw $a0, resultado
    li $v0, 1
    syscall

    li $v0, 10
    syscall
