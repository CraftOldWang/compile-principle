    .option nopic
    .attribute arch, "rv64i2p1_m2p0_d2p2"
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .text
    .globl main
main:
    
    # 对齐16字节
    # int a0,b4,i8,t12,n16  + 返回地址保存
    addi sp, sp, -32
    # why 24??， 约定放在最上面...
    sd ra, 24(sp)

    # 赋值
    # a = 0
    li t0, 0 # a
    sw t0, 0(sp)

    # b = 1;
    li t0, 1 # b
    sw t0, 4(sp)

    # i = 1;
    li t0, 1 # i
    sw t0, 8(sp)

    # n = getint();
    call getint
    sw a0, 16(sp)
    
    # putint(a);
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
    # while ( i < n)
    lw t0, 8(sp)
    lw t1, 16(sp)
    bge t0, t1, .Lend

    # a
    lw t0, 0(sp)
    # t=b
    # 栈上的 t 貌似可以优化掉，吧 a=t放前面...
    lw t1, 4(sp)
    sw t1, 12(sp)

    # b = a + b
    add t1, t0, t1
    sw t1, 4(sp)

    # putint(b)
    mv a0, t1
    call putint

    # putch(10);
    li a0, 10
    call putch

    # a = t
    lw t0, 12(sp)
    sw t0, 0(sp)

    # i = i + 1;
    lw t0, 8(sp)
    addi t0, t0, 1
    sw t0, 8(sp)

    j .Lloop

.Lend:
    li a0, 0
    ld ra, 24(sp)
    addi sp, sp, 32
    ret



