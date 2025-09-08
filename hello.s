.data
    # Define a string "Hello, World!" e um caractere de nova linha.
    # O .string cria uma string terminada em null (\0)
    msg:
        .string "Hello, World!\n"

.text
    # A etiqueta .global _start torna o ponto de entrada visível para o linker.
    .global _start

_start:
    # Registradores usados para a syscall 'write'
    # a0 (x10) = 1 (file descriptor para stdout)
    li a0, 1

    # a1 (x11) = endereço da string 'msg'
    # 'la' (Load Address) é uma pseudoinstrução que carrega o endereço
    # de um rótulo em um registrador.
    la a1, msg

    # a2 (x12) = 14 (tamanho da string + nova linha)
    # Conte "H, e, l, l, o, ,,  , W, o, r, l, d, !, \n"
    li a2, 14

    # a7 (x17) = 64 (número da syscall 'write' no Linux)
    li a7, 64

    # ecall executa a chamada de sistema
    ecall

    # Registradores usados para a syscall 'exit'
    # a0 (x10) = 0 (código de saída)
    li a0, 0

    # a7 (x17) = 93 (número da syscall 'exit' no Linux)
    li a7, 93

    # ecall executa a chamada de sistema e encerra o programa.
    ecall

