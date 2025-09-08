.section .data
msg:
.asciz "Hello, world!\n"

.section .text
.globl _start

_start:
# a7 = syscall number for write (64)
li a7, 64
# a0 = file descriptor (stdout = 1)
li a0, 1
# a1 = pointer to message
la a1, msg
# a2 = length of message
li a2, 14
ecall

# exit syscall
li a7, 93
li a0, 0
ecall