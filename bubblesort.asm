    .data
array:  .word 7, 5, 2, 1, 1, 3, 4   # vetor inicial
msg:    .asciz "Sorted array:\n"
newline:.asciz "\n"

    .text
    .globl _start

_start:
    # print mensagem inicial
    li a7, 64
    li a0, 1
    la a1, msg
    li a2, 15
    ecall

    li t0, 7          # MAX = 7
    addi t0, t0, -1   # MAX-1 (limite externo)

outer_loop:
    mv t1, x0         # i = 0
    ble t0, x0, done_outer   # se MAX-1 < 0 -> fim

inner_loop:
    li t2, 6          # j = MAX-1 = 6 (último índice)
    sub t2, t2, t1    # j = (MAX-1) - i

check_swap:
    ble t2, x0, end_inner   # se j <= 0, fim do loop interno

    # load num[j-1] e num[j]
    la t3, array
    slli t4, t2, 2       # offset = j*4
    add t3, t3, t4
    lw t5, -4(t3)        # num[j-1]
    lw t6, 0(t3)         # num[j]

    ble t5, t6, no_swap  # if num[j-1] <= num[j] skip

    # swap
    sw t6, -4(t3)        # num[j-1] = num[j]
    sw t5, 0(t3)         # num[j] = aux

no_swap:
    addi t2, t2, -1      # j--
    j check_swap

end_inner:
    addi t1, t1, 1       # i++
    blt t1, t0, inner_loop
    addi t0, t0, -1      # MAX--
    bge t0, x0, outer_loop

done_outer:
    # imprimir array ordenado
    li t1, 0             # i = 0
print_loop:
    la t2, array
    slli t3, t1, 2
    add t2, t2, t3
    lw a0, 0(t2)         # carrega array[i]

    # imprimir inteiro como syscall (write int é 1 no RARS, mas em linux real precisa converter)
    mv a1, a0
    li a7, 1             # print int (syscall do RARS)
    ecall

    # imprimir \n
    li a7, 64
    li a0, 1
    la a1, newline
    li a2, 1
    ecall

    addi t1, t1, 1
    li t4, 7
    blt t1, t4, print_loop

    # exit
    li a7, 93
    li a0, 0
    ecall
