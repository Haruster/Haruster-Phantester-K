	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 0
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
	subq	$1088, %rsp                     ## imm = 0x440
	xorl	%edx, %edx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -1060(%rbp)
	movl	$2, %edi
	movl	$1, %esi
	callq	_socket
	xorl	%esi, %esi
	movl	%eax, -1064(%rbp)
	leaq	-1056(%rbp), %rdi
	movl	$16, %edx
	callq	_memset
	leaq	L_.str(%rip), %rax
	movl	%eax, %ecx
	movl	%ecx, %eax
	andl	$-16777216, %eax                ## imm = 0xFF000000
	shrl	$24, %eax
	movl	%ecx, %edx
	andl	$16711680, %edx                 ## imm = 0xFF0000
	shrl	$8, %edx
	orl	%edx, %eax
	movl	%ecx, %edx
	andl	$65280, %edx                    ## imm = 0xFF00
	shll	$8, %edx
	orl	%edx, %eax
	andl	$255, %ecx
	shll	$24, %ecx
	orl	%ecx, %eax
	movl	%eax, -1052(%rbp)
	movb	$2, -1055(%rbp)
	movw	$10275, -1054(%rbp)             ## imm = 0x2823
	movl	-1064(%rbp), %edi
	leaq	-1056(%rbp), %rsi
	movl	$16, %edx
	callq	_connect
	cmpl	$-1, %eax
	jne	LBB0_2
## %bb.1:
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$-1, -1060(%rbp)
	jmp	LBB0_5
LBB0_2:
	leaq	-1040(%rbp), %rsi
	movl	-1064(%rbp), %edi
	movl	$1024, %edx                     ## imm = 0x400
	callq	_read
                                        ## kill: def $eax killed $eax killed $rax
	movl	%eax, -1072(%rbp)
	cmpl	$0, %eax
	jge	LBB0_4
## %bb.3:
	movl	$-1, -1060(%rbp)
	jmp	LBB0_5
LBB0_4:
	leaq	-1040(%rbp), %rsi
	movslq	-1072(%rbp), %rax
	movb	$0, -1040(%rbp,%rax)
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	-1064(%rbp), %edi
	callq	_close
LBB0_5:
	movl	-1060(%rbp), %eax
	movl	%eax, -1076(%rbp)               ## 4-byte Spill
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_7
## %bb.6:
	movl	-1076(%rbp), %eax               ## 4-byte Reload
	addq	$1088, %rsp                     ## imm = 0x440
	popq	%rbp
	retq
LBB0_7:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"127.0.0.1"

L_.str.1:                               ## @.str.1
	.asciz	"Can not bind\n"

L_.str.2:                               ## @.str.2
	.asciz	"Received Data = %s\n"

.subsections_via_symbols
