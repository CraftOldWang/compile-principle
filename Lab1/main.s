	.text
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x400921f9f01b866e              # double 3.1415899999999999
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_1:
	.long	0x40000000                      # float 2
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
	movl	$0, -24(%rbp)
	movl	$5, -16(%rbp)
	movl	-16(%rbp), %ebx
	movl	-16(%rbp), %edi
	callq	factorial
	movabsq	$.L.str, %rdi
	movl	%ebx, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	printf@PLT
	movss	.LCPI0_1(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -12(%rbp)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-12(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movss	-20(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	cvtss2sd	%xmm1, %xmm1
	movabsq	$.L.str.1, %rdi
	movb	$2, %al
	callq	printf@PLT
	movl	global_var, %eax
	addl	$1, %eax
	movl	%eax, uninitialized_global
	movl	global_var, %esi
	movl	uninitialized_global, %edx
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	factorial                       # -- Begin function factorial
	.p2align	4, 0x90
	.type	factorial,@function
factorial:                              # @factorial
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, -12(%rbp)
	cmpl	$1, -12(%rbp)
	jg	.LBB1_2
# %bb.1:
	movl	$1, -16(%rbp)
	jmp	.LBB1_3
.LBB1_2:
	movl	-12(%rbp), %ebx
	movl	-12(%rbp), %edi
	subl	$1, %edi
	callq	factorial
	imull	%eax, %ebx
	movl	%ebx, -16(%rbp)
.LBB1_3:
	movl	-16(%rbp), %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	factorial, .Lfunc_end1-factorial
	.cfi_endproc
                                        # -- End function
	.type	global_var,@object              # @global_var
	.data
	.globl	global_var
	.p2align	2
global_var:
	.long	100                             # 0x64
	.size	global_var, 4

	.type	gravity,@object                 # @gravity
	.section	.rodata,"a",@progbits
	.globl	gravity
	.p2align	2
gravity:
	.long	0x411ccccd                      # float 9.80000019
	.size	gravity, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"The factorial of %d is %d\n"
	.size	.L.str, 27

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"The area of a circle with radius %.2f is %.2f\n"
	.size	.L.str.1, 47

	.type	uninitialized_global,@object    # @uninitialized_global
	.bss
	.globl	uninitialized_global
	.p2align	2
uninitialized_global:
	.long	0                               # 0x0
	.size	uninitialized_global, 4

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"Global var: %d, Uninitialized global: %d\n"
	.size	.L.str.2, 42

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
