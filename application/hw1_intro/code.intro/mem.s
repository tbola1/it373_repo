	.file	"mem.c"
	.section	.rodata
.LC0:
	.string	"common.h"
.LC1:
	.string	"rc == 0"
	.text
	.globl	GetTime
	.type	GetTime, @function
GetTime:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L2
	movl	$__PRETTY_FUNCTION__.3341, %ecx
	movl	$10, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
.L2:
	movq	-32(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	GetTime, .-GetTime
	.globl	Spin
	.type	Spin, @function
Spin:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, %eax
	call	GetTime
	movsd	%xmm0, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	nop
.L5:
	movl	$0, %eax
	call	GetTime
	movapd	%xmm0, %xmm1
	subsd	-8(%rbp), %xmm1
	cvtsi2sd	-20(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L5
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	Spin, .-Spin
	.section	.rodata
.LC3:
	.string	"usage: mem <value>\n"
.LC4:
	.string	"mem.c"
.LC5:
	.string	"p != ((void *)0)"
	.align 8
.LC6:
	.string	"(pid:%d) addr of p:        %llx\n"
	.align 8
.LC7:
	.string	"(pid:%d) addr stored in p: %llx\n"
.LC8:
	.string	"(pid:%d) value of p: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	cmpl	$2, -36(%rbp)
	je	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L7:
	movl	$4, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	testq	%rax, %rax
	jne	.L8
	movl	$__PRETTY_FUNCTION__.3354, %ecx
	movl	$16, %edx
	movl	$.LC4, %esi
	movl	$.LC5, %edi
	call	__assert_fail
.L8:
	leaq	-24(%rbp), %rbx
	call	getpid
	movq	%rbx, %rdx
	movl	%eax, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rax
	movq	%rax, %rbx
	call	getpid
	movq	%rbx, %rdx
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rbx
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, (%rbx)
.L9:
	movl	$1, %edi
	call	Spin
	movq	-24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movl	(%rdx), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %ebx
	call	getpid
	movl	%ebx, %edx
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	jmp	.L9
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3341, @object
	.size	__PRETTY_FUNCTION__.3341, 8
__PRETTY_FUNCTION__.3341:
	.string	"GetTime"
	.type	__PRETTY_FUNCTION__.3354, @object
	.size	__PRETTY_FUNCTION__.3354, 5
__PRETTY_FUNCTION__.3354:
	.string	"main"
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
