	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 0
	.globl	_XorCrypto                      ## -- Begin function XorCrypto
	.p2align	4, 0x90
_XorCrypto:                             ## @XorCrypto
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movslq	-20(%rbp), %rdi
	shlq	$0, %rdi
	callq	_malloc
	movq	%rax, -32(%rbp)
	movl	$0, -36(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movsbl	(%rax,%rcx), %eax
	movl	%eax, -40(%rbp)                 ## 4-byte Spill
	movq	-16(%rbp), %rcx
	movl	-36(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	-40(%rbp), %eax                 ## 4-byte Reload
	movslq	%edx, %rdx
	movsbl	(%rcx,%rdx), %ecx
	xorl	%ecx, %eax
	movb	%al, %dl
	movq	-32(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movb	%dl, (%rax,%rcx)
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_1
LBB0_4:
	movq	-32(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
                                        ## kill: def $eax killed $eax killed $rax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
                                        ## kill: def $eax killed $eax killed $rax
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %ecx
	callq	_XorCrypto
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rsi
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	" "

L_.str.1:                               ## @.str.1
	.asciz	"%s"

.subsections_via_symbols
