    .option nopic
    .attribute arch, "rv64i2p1_m2p0_d2p2"
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .text
    .globl main
main:
    # 预留栈空间存局部变量 (a,b,i,t,n)，每个 int 占 4 字节
    addi sp, sp, -32
    sd ra, 24(sp)        # 保存返回地址

    # a = 0
    li t0, 0
    sw t0, 0(sp)

    # b = 1
    li t0, 1
    sw t0, 4(sp)

    # i = 1
    li t0, 1
    sw t0, 8(sp)

    # n = getint()
    call getint
    sw a0, 12(sp)

    # putint(a)
    lw a0, 0(sp)
    call putint
    # putch(10)
    li a0, 10
    call putch

    # putint(b)
    lw a0, 4(sp)
    call putint
    # putch(10)
    li a0, 10
    call putch

.Lloop:
    # while (i < n)
    lw t0, 8(sp)     # i
    lw t1, 12(sp)    # n
    bge t0, t1, .Lend

    # t = b
    lw t2, 4(sp)
    sw t2, 16(sp)

    # b = a + b
    lw t3, 0(sp)     # a
    add t2, t3, t2   # a + b
    sw t2, 4(sp)

    # putint(b)
    mv a0, t2
    call putint
    # putch(10)
    li a0, 10
    call putch

    # a = t
    lw t2, 16(sp)
    sw t2, 0(sp)

    # i = i + 1
    lw t0, 8(sp)
    addi t0, t0, 1
    sw t0, 8(sp)

    j .Lloop

.Lend:
    li a0, 0
    ld ra, 24(sp)
    addi sp, sp, 32
    ret
