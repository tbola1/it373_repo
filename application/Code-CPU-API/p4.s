	.file	"p4.c"
	.section	.rodata
.LC0:
	.string	"fork failed\n"
.LC1:
	.string	"./p4.output"
.LC2:
	.string	"wc"
.LC3:
	.string	"p4.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	call	fork
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L2:
	cmpl	$0, -40(%rbp)
	jne	.L3
	movl	$1, %edi
	call	close
	movl	$448, %edx
	movl	$577, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	open
	movl	$.LC2, %edi
	call	strdup
	movq	%rax, -32(%rbp)
	movl	$.LC3, %edi
	call	strdup
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	-32(%rbp), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp
	jmp	.L4
.L3:
	movl	$0, %eax
	movq	%rax, %rdi
	call	wait
	movl	%eax, -36(%rbp)
.L4:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
