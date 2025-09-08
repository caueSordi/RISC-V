.globl main
.text
main:
    addi a0, x0, 5   # arg1 = 5
    addi a1, x0, 7   # arg2 = 7
    jal ra, soma     # chama função soma
    # resultado agora tá em a0

    addi a7, x0, 1   # print int
    ecall

    addi a7, x0, 10  # exit
    ecall

soma:
    add a0, a0, a1   # soma args
    jr ra            # retorna
