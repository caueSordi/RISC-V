    .data
prompt:     .asciz "Digite um numero: "
success:    .asciz "Acertou! Numero correto.\n"

    .text
    .globl _start

_start:
loop:
    # print prompt
    li a7, 4           # syscall print_string
    la a0, prompt
    ecall

    # ler inteiro
    li a7, 5           # syscall read_int
    ecall
    mv t0, a0          # t0 = numero lido

    # if (t0 != 4) -> volta pro loop
    li t1, 4
    bne t0, t1, loop

    # se chegou aqui, é porque t0 == 4
    li a7, 4
    la a0, success
    ecall

    # encerrar
    li a7, 10
    ecall
