    .data
prompt: .asciz "Enter a number for the cumulative sum: "
newline: .asciz "\n"

    .text
    .globl _start

_start:
    # print prompt
    li a7, 4           
    la a0, prompt
    ecall

    # read integer (N)
    li a7, 5           
    ecall
    mv t0, a0          # t0 = N

    li t1, 1           # i = 1
    li t2, 0           # sum = 0

loop:
    bgt t1, t0, end    # if i > N, exit loop
    add t2, t2, t1     # sum = sum + i
    addi t1, t1, 1     # i = i + 1
    j loop

end:
    # print result (sum)
    mv a0, t2
    li a7, 1           # print int
    ecall

    # print newline
    li a7, 4
    la a0, newline
    ecall

    # exit
    li a7, 10
    ecall
