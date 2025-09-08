#vamos colocar espaço no buffer para o usuario
.data
	buffer: .space 4 #bytes de memoria para o usuario
	msg: .asciz "enter a number: "
.text
.globl _start
_start:
	#como dar print na mensagem?? 
	li a7, 64 #comando WRITE
	li a0, 1 #fd = stdout
	la a1, msg #endereço
	li a2, 15 #tamanho da msg
	ecall
	
	#vamos pegar o imput
	li a7, 63 #syscall para LER
	li a0, 0 #stdin basicamente
	la a1, buffer #endereço
	li a2, 4 #maximo de bytes
	ecall
	
	#carregar ascii do buffer
	la t0 , buffer
	lb t1, 0(t0)
	
	#converter ascii para int
	addi t1, t1, -48 # 0 em ascii é 48
	
	#add 1
	addi t2, t1, 2
	
	#converter para ascii dnvo para dps dar print
	addi t2, t2, 48
	
	#armazenar no buffer
	sb t2, 0(t0)
	
	#dar print
	li a7, 64
	li a0, 1
	la a1, buffer
	li a2, 1
	ecall
	
	#fechar programa
	li a7, 93
	li a0, 0 
	ecall
	