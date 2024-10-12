.data

msg_A: .asciiz "Digite o valor de A: "
msg_B: .asciiz "Digite o valor de B: "
msg_C: .asciiz "O valor de C é: "

A: .word 0
B: .word 0
C: .word 0

.text
.globl main

main:
    # Solicita o valor de A ao usuário
    li $v0, 4
    la $a0, msg_A
    syscall
    li $v0, 5
    syscall
    sw $v0, A

    # Solicita o valor de B ao usuário
    li $v0, 4
    la $a0, msg_B
    syscall
    li $v0, 5
    syscall
    sw $v0, B
    
    
    # Carrega os valores de A e B
    lw $t0, A
    lw $t1, B

    # Compara A e B
    beq $t0, $t1, sao_iguais  # Se A e B forem iguais, vá para sao_iguais

    # Se não forem iguais, multiplique A por B
    mul $t2, $t0, $t1
    sw $t2, C
    j fim  # Salta para o final do programa

sao_iguais:
    # Se A e B forem iguais, some os valores
    add $t2, $t0, $t1
    sw $t2, C

fim:
    # Exibe o valor de C
    li $v0, 4
    la $a0, msg_C
    syscall
    lw $a0, C
    li $v0, 1
    syscall

    # Encerra o programa
    li $v0, 10
    syscall