	.file	"main.c"
	.text
	.globl	bombs
	.bss
	.align 8
	.type	bombs, @object
	.size	bombs, 8
bombs:
	.zero	8
	.globl	flags
	.align 8
	.type	flags, @object
	.size	flags, 8
flags:
	.zero	8
	.globl	disco
	.align 8
	.type	disco, @object
	.size	disco, 8
disco:
	.zero	8
	.globl	vars
	.align 8
	.type	vars, @object
	.size	vars, 8
vars:
	.zero	8
	.globl	pos
	.align 4
	.type	pos, @object
	.size	pos, 4
pos:
	.zero	4
	.globl	tmp
	.align 4
	.type	tmp, @object
	.size	tmp, 4
tmp:
	.zero	4
	.globl	x
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.globl	y
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.text
	.globl	reset_map
	.type	reset_map, @function
reset_map:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$0, bombs(%rip)
	movq	$0, flags(%rip)
	movq	$0, disco(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	reset_map, .-reset_map
	.globl	generate_bombs
	.type	generate_bombs, @function
generate_bombs:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	generate_bombs, .-generate_bombs
	.section	.rodata
	.align 8
.LC0:
	.string	"Bombs   \n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n"
	.align 8
.LC1:
	.string	"Flags   \n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n"
	.align 8
.LC2:
	.string	"Disco   \n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n%c %c %c %c %c %c %c %c\n"
.LC3:
	.string	"Position x: "
.LC4:
	.string	"%d"
.LC5:
	.string	"Position y: "
.LC6:
	.string	"Perdu Dommage"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$28, pos(%rip)
	movl	$16, -68(%rbp)
	jmp	.L6
.L7:
	call	rand@PLT
	cltd
	shrl	$26, %edx
	addl	%edx, %eax
	andl	$63, %eax
	subl	%edx, %eax
	movl	%eax, tmp(%rip)
	movq	bombs(%rip), %rdx
	movl	tmp(%rip), %eax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L6
	movl	tmp(%rip), %edx
	movl	pos(%rip), %eax
	cmpl	%eax, %edx
	je	.L6
	movl	tmp(%rip), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	bombs(%rip), %rax
	orq	%rdx, %rax
	movq	%rax, bombs(%rip)
	subl	$1, -68(%rbp)
.L6:
	cmpl	$0, -68(%rbp)
	jg	.L7
.L393:
	movq	bombs(%rip), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L8
	movl	$49, -84(%rbp)
	jmp	.L9
.L8:
	movl	$48, -84(%rbp)
.L9:
	movq	bombs(%rip), %rax
	andl	$2, %eax
	testq	%rax, %rax
	je	.L10
	movl	$49, -88(%rbp)
	jmp	.L11
.L10:
	movl	$48, -88(%rbp)
.L11:
	movq	bombs(%rip), %rax
	andl	$4, %eax
	testq	%rax, %rax
	je	.L12
	movl	$49, -92(%rbp)
	jmp	.L13
.L12:
	movl	$48, -92(%rbp)
.L13:
	movq	bombs(%rip), %rax
	andl	$8, %eax
	testq	%rax, %rax
	je	.L14
	movl	$49, -96(%rbp)
	jmp	.L15
.L14:
	movl	$48, -96(%rbp)
.L15:
	movq	bombs(%rip), %rax
	andl	$16, %eax
	testq	%rax, %rax
	je	.L16
	movl	$49, -100(%rbp)
	jmp	.L17
.L16:
	movl	$48, -100(%rbp)
.L17:
	movq	bombs(%rip), %rax
	andl	$32, %eax
	testq	%rax, %rax
	je	.L18
	movl	$49, -104(%rbp)
	jmp	.L19
.L18:
	movl	$48, -104(%rbp)
.L19:
	movq	bombs(%rip), %rax
	andl	$64, %eax
	testq	%rax, %rax
	je	.L20
	movl	$49, -108(%rbp)
	jmp	.L21
.L20:
	movl	$48, -108(%rbp)
.L21:
	movq	bombs(%rip), %rax
	andl	$128, %eax
	testq	%rax, %rax
	je	.L22
	movl	$49, -112(%rbp)
	jmp	.L23
.L22:
	movl	$48, -112(%rbp)
.L23:
	movq	bombs(%rip), %rax
	andl	$256, %eax
	testq	%rax, %rax
	je	.L24
	movl	$49, -116(%rbp)
	jmp	.L25
.L24:
	movl	$48, -116(%rbp)
.L25:
	movq	bombs(%rip), %rax
	andl	$512, %eax
	testq	%rax, %rax
	je	.L26
	movl	$49, -120(%rbp)
	jmp	.L27
.L26:
	movl	$48, -120(%rbp)
.L27:
	movq	bombs(%rip), %rax
	andl	$1024, %eax
	testq	%rax, %rax
	je	.L28
	movl	$49, -124(%rbp)
	jmp	.L29
.L28:
	movl	$48, -124(%rbp)
.L29:
	movq	bombs(%rip), %rax
	andl	$2048, %eax
	testq	%rax, %rax
	je	.L30
	movl	$49, -128(%rbp)
	jmp	.L31
.L30:
	movl	$48, -128(%rbp)
.L31:
	movq	bombs(%rip), %rax
	andl	$4096, %eax
	testq	%rax, %rax
	je	.L32
	movl	$49, -132(%rbp)
	jmp	.L33
.L32:
	movl	$48, -132(%rbp)
.L33:
	movq	bombs(%rip), %rax
	andl	$8192, %eax
	testq	%rax, %rax
	je	.L34
	movl	$49, -136(%rbp)
	jmp	.L35
.L34:
	movl	$48, -136(%rbp)
.L35:
	movq	bombs(%rip), %rax
	andl	$16384, %eax
	testq	%rax, %rax
	je	.L36
	movl	$49, -140(%rbp)
	jmp	.L37
.L36:
	movl	$48, -140(%rbp)
.L37:
	movq	bombs(%rip), %rax
	andl	$32768, %eax
	testq	%rax, %rax
	je	.L38
	movl	$49, -144(%rbp)
	jmp	.L39
.L38:
	movl	$48, -144(%rbp)
.L39:
	movq	bombs(%rip), %rax
	andl	$65536, %eax
	testq	%rax, %rax
	je	.L40
	movl	$49, -148(%rbp)
	jmp	.L41
.L40:
	movl	$48, -148(%rbp)
.L41:
	movq	bombs(%rip), %rax
	andl	$131072, %eax
	testq	%rax, %rax
	je	.L42
	movl	$49, -152(%rbp)
	jmp	.L43
.L42:
	movl	$48, -152(%rbp)
.L43:
	movq	bombs(%rip), %rax
	andl	$262144, %eax
	testq	%rax, %rax
	je	.L44
	movl	$49, -156(%rbp)
	jmp	.L45
.L44:
	movl	$48, -156(%rbp)
.L45:
	movq	bombs(%rip), %rax
	andl	$524288, %eax
	testq	%rax, %rax
	je	.L46
	movl	$49, -160(%rbp)
	jmp	.L47
.L46:
	movl	$48, -160(%rbp)
.L47:
	movq	bombs(%rip), %rax
	andl	$1048576, %eax
	testq	%rax, %rax
	je	.L48
	movl	$49, -164(%rbp)
	jmp	.L49
.L48:
	movl	$48, -164(%rbp)
.L49:
	movq	bombs(%rip), %rax
	andl	$2097152, %eax
	testq	%rax, %rax
	je	.L50
	movl	$49, -168(%rbp)
	jmp	.L51
.L50:
	movl	$48, -168(%rbp)
.L51:
	movq	bombs(%rip), %rax
	andl	$4194304, %eax
	testq	%rax, %rax
	je	.L52
	movl	$49, -172(%rbp)
	jmp	.L53
.L52:
	movl	$48, -172(%rbp)
.L53:
	movq	bombs(%rip), %rax
	andl	$8388608, %eax
	testq	%rax, %rax
	je	.L54
	movl	$49, -176(%rbp)
	jmp	.L55
.L54:
	movl	$48, -176(%rbp)
.L55:
	movq	bombs(%rip), %rax
	andl	$16777216, %eax
	testq	%rax, %rax
	je	.L56
	movl	$49, -180(%rbp)
	jmp	.L57
.L56:
	movl	$48, -180(%rbp)
.L57:
	movq	bombs(%rip), %rax
	andl	$33554432, %eax
	testq	%rax, %rax
	je	.L58
	movl	$49, -184(%rbp)
	jmp	.L59
.L58:
	movl	$48, -184(%rbp)
.L59:
	movq	bombs(%rip), %rax
	andl	$67108864, %eax
	testq	%rax, %rax
	je	.L60
	movl	$49, -188(%rbp)
	jmp	.L61
.L60:
	movl	$48, -188(%rbp)
.L61:
	movq	bombs(%rip), %rax
	andl	$134217728, %eax
	testq	%rax, %rax
	je	.L62
	movl	$49, -192(%rbp)
	jmp	.L63
.L62:
	movl	$48, -192(%rbp)
.L63:
	movq	bombs(%rip), %rax
	andl	$268435456, %eax
	testq	%rax, %rax
	je	.L64
	movl	$49, -196(%rbp)
	jmp	.L65
.L64:
	movl	$48, -196(%rbp)
.L65:
	movq	bombs(%rip), %rax
	andl	$536870912, %eax
	testq	%rax, %rax
	je	.L66
	movl	$49, -200(%rbp)
	jmp	.L67
.L66:
	movl	$48, -200(%rbp)
.L67:
	movq	bombs(%rip), %rax
	andl	$1073741824, %eax
	testq	%rax, %rax
	je	.L68
	movl	$49, -204(%rbp)
	jmp	.L69
.L68:
	movl	$48, -204(%rbp)
.L69:
	movq	bombs(%rip), %rax
	andl	$2147483648, %eax
	testq	%rax, %rax
	je	.L70
	movl	$49, -208(%rbp)
	jmp	.L71
.L70:
	movl	$48, -208(%rbp)
.L71:
	movq	bombs(%rip), %rdx
	movabsq	$4294967296, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L72
	movl	$49, -212(%rbp)
	jmp	.L73
.L72:
	movl	$48, -212(%rbp)
.L73:
	movq	bombs(%rip), %rdx
	movabsq	$8589934592, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L74
	movl	$49, -216(%rbp)
	jmp	.L75
.L74:
	movl	$48, -216(%rbp)
.L75:
	movq	bombs(%rip), %rdx
	movabsq	$17179869184, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L76
	movl	$49, -220(%rbp)
	jmp	.L77
.L76:
	movl	$48, -220(%rbp)
.L77:
	movq	bombs(%rip), %rdx
	movabsq	$34359738368, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L78
	movl	$49, -224(%rbp)
	jmp	.L79
.L78:
	movl	$48, -224(%rbp)
.L79:
	movq	bombs(%rip), %rdx
	movabsq	$68719476736, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L80
	movl	$49, -228(%rbp)
	jmp	.L81
.L80:
	movl	$48, -228(%rbp)
.L81:
	movq	bombs(%rip), %rdx
	movabsq	$137438953472, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L82
	movl	$49, -232(%rbp)
	jmp	.L83
.L82:
	movl	$48, -232(%rbp)
.L83:
	movq	bombs(%rip), %rdx
	movabsq	$274877906944, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L84
	movl	$49, -236(%rbp)
	jmp	.L85
.L84:
	movl	$48, -236(%rbp)
.L85:
	movq	bombs(%rip), %rdx
	movabsq	$549755813888, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L86
	movl	$49, -240(%rbp)
	jmp	.L87
.L86:
	movl	$48, -240(%rbp)
.L87:
	movq	bombs(%rip), %rdx
	movabsq	$1099511627776, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L88
	movl	$49, -244(%rbp)
	jmp	.L89
.L88:
	movl	$48, -244(%rbp)
.L89:
	movq	bombs(%rip), %rdx
	movabsq	$2199023255552, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L90
	movl	$49, -248(%rbp)
	jmp	.L91
.L90:
	movl	$48, -248(%rbp)
.L91:
	movq	bombs(%rip), %rdx
	movabsq	$4398046511104, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L92
	movl	$49, -252(%rbp)
	jmp	.L93
.L92:
	movl	$48, -252(%rbp)
.L93:
	movq	bombs(%rip), %rdx
	movabsq	$8796093022208, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L94
	movl	$49, -256(%rbp)
	jmp	.L95
.L94:
	movl	$48, -256(%rbp)
.L95:
	movq	bombs(%rip), %rdx
	movabsq	$17592186044416, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L96
	movl	$49, -260(%rbp)
	jmp	.L97
.L96:
	movl	$48, -260(%rbp)
.L97:
	movq	bombs(%rip), %rdx
	movabsq	$35184372088832, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L98
	movl	$49, -264(%rbp)
	jmp	.L99
.L98:
	movl	$48, -264(%rbp)
.L99:
	movq	bombs(%rip), %rdx
	movabsq	$70368744177664, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L100
	movl	$49, -268(%rbp)
	jmp	.L101
.L100:
	movl	$48, -268(%rbp)
.L101:
	movq	bombs(%rip), %rdx
	movabsq	$140737488355328, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L102
	movl	$49, -272(%rbp)
	jmp	.L103
.L102:
	movl	$48, -272(%rbp)
.L103:
	movq	bombs(%rip), %rdx
	movabsq	$281474976710656, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L104
	movl	$49, -276(%rbp)
	jmp	.L105
.L104:
	movl	$48, -276(%rbp)
.L105:
	movq	bombs(%rip), %rdx
	movabsq	$562949953421312, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L106
	movl	$49, -280(%rbp)
	jmp	.L107
.L106:
	movl	$48, -280(%rbp)
.L107:
	movq	bombs(%rip), %rdx
	movabsq	$1125899906842624, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L108
	movl	$49, %r15d
	jmp	.L109
.L108:
	movl	$48, %r15d
.L109:
	movq	bombs(%rip), %rdx
	movabsq	$2251799813685248, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L110
	movl	$49, %r14d
	jmp	.L111
.L110:
	movl	$48, %r14d
.L111:
	movq	bombs(%rip), %rdx
	movabsq	$4503599627370496, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L112
	movl	$49, %r13d
	jmp	.L113
.L112:
	movl	$48, %r13d
.L113:
	movq	bombs(%rip), %rdx
	movabsq	$9007199254740992, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L114
	movl	$49, %r12d
	jmp	.L115
.L114:
	movl	$48, %r12d
.L115:
	movq	bombs(%rip), %rdx
	movabsq	$18014398509481984, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L116
	movl	$49, %ebx
	jmp	.L117
.L116:
	movl	$48, %ebx
.L117:
	movq	bombs(%rip), %rdx
	movabsq	$36028797018963968, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L118
	movl	$49, %r11d
	jmp	.L119
.L118:
	movl	$48, %r11d
.L119:
	movq	bombs(%rip), %rdx
	movabsq	$72057594037927936, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L120
	movl	$49, %r9d
	jmp	.L121
.L120:
	movl	$48, %r9d
.L121:
	movq	bombs(%rip), %rdx
	movabsq	$144115188075855872, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L122
	movl	$49, %r8d
	jmp	.L123
.L122:
	movl	$48, %r8d
.L123:
	movq	bombs(%rip), %rdx
	movabsq	$288230376151711744, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L124
	movl	$49, %esi
	jmp	.L125
.L124:
	movl	$48, %esi
.L125:
	movq	bombs(%rip), %rdx
	movabsq	$576460752303423488, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L126
	movl	$49, %r10d
	jmp	.L127
.L126:
	movl	$48, %r10d
.L127:
	movq	bombs(%rip), %rdx
	movabsq	$1152921504606846976, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L128
	movl	$49, %edi
	jmp	.L129
.L128:
	movl	$48, %edi
.L129:
	movq	bombs(%rip), %rdx
	movabsq	$2305843009213693952, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L130
	movl	$49, %ecx
	jmp	.L131
.L130:
	movl	$48, %ecx
.L131:
	movq	bombs(%rip), %rdx
	movabsq	$4611686018427387904, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L132
	movl	$49, %edx
	jmp	.L133
.L132:
	movl	$48, %edx
.L133:
	movq	bombs(%rip), %rax
	testq	%rax, %rax
	jns	.L134
	movl	$49, -284(%rbp)
	jmp	.L135
.L134:
	movl	$48, -284(%rbp)
.L135:
	subq	$8, %rsp
	movl	-84(%rbp), %eax
	pushq	%rax
	movl	-88(%rbp), %eax
	pushq	%rax
	movl	-92(%rbp), %eax
	pushq	%rax
	movl	-96(%rbp), %eax
	pushq	%rax
	movl	-100(%rbp), %eax
	pushq	%rax
	movl	-104(%rbp), %eax
	pushq	%rax
	movl	-108(%rbp), %eax
	pushq	%rax
	movl	-112(%rbp), %eax
	pushq	%rax
	movl	-116(%rbp), %eax
	pushq	%rax
	movl	-120(%rbp), %eax
	pushq	%rax
	movl	-124(%rbp), %eax
	pushq	%rax
	movl	-128(%rbp), %eax
	pushq	%rax
	movl	-132(%rbp), %eax
	pushq	%rax
	movl	-136(%rbp), %eax
	pushq	%rax
	movl	-140(%rbp), %eax
	pushq	%rax
	movl	-144(%rbp), %eax
	pushq	%rax
	movl	-148(%rbp), %eax
	pushq	%rax
	movl	-152(%rbp), %eax
	pushq	%rax
	movl	-156(%rbp), %eax
	pushq	%rax
	movl	-160(%rbp), %eax
	pushq	%rax
	movl	-164(%rbp), %eax
	pushq	%rax
	movl	-168(%rbp), %eax
	pushq	%rax
	movl	-172(%rbp), %eax
	pushq	%rax
	movl	-176(%rbp), %eax
	pushq	%rax
	movl	-180(%rbp), %eax
	pushq	%rax
	movl	-184(%rbp), %eax
	pushq	%rax
	movl	-188(%rbp), %eax
	pushq	%rax
	movl	-192(%rbp), %eax
	pushq	%rax
	movl	-196(%rbp), %eax
	pushq	%rax
	movl	-200(%rbp), %eax
	pushq	%rax
	movl	-204(%rbp), %eax
	pushq	%rax
	movl	-208(%rbp), %eax
	pushq	%rax
	movl	-212(%rbp), %eax
	pushq	%rax
	movl	-216(%rbp), %eax
	pushq	%rax
	movl	-220(%rbp), %eax
	pushq	%rax
	movl	-224(%rbp), %eax
	pushq	%rax
	movl	-228(%rbp), %eax
	pushq	%rax
	movl	-232(%rbp), %eax
	pushq	%rax
	movl	-236(%rbp), %eax
	pushq	%rax
	movl	-240(%rbp), %eax
	pushq	%rax
	movl	-244(%rbp), %eax
	pushq	%rax
	movl	-248(%rbp), %eax
	pushq	%rax
	movl	-252(%rbp), %eax
	pushq	%rax
	movl	-256(%rbp), %eax
	pushq	%rax
	movl	-260(%rbp), %eax
	pushq	%rax
	movl	-264(%rbp), %eax
	pushq	%rax
	movl	-268(%rbp), %eax
	pushq	%rax
	movl	-272(%rbp), %eax
	pushq	%rax
	movl	-276(%rbp), %eax
	pushq	%rax
	movl	-280(%rbp), %eax
	pushq	%rax
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%r11
	pushq	%r9
	pushq	%r8
	pushq	%rsi
	movl	%r10d, %r9d
	movl	%edi, %r8d
	movl	-284(%rbp), %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$480, %rsp
	movq	flags(%rip), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L136
	movl	$49, -84(%rbp)
	jmp	.L137
.L136:
	movl	$48, -84(%rbp)
.L137:
	movq	flags(%rip), %rax
	andl	$2, %eax
	testq	%rax, %rax
	je	.L138
	movl	$49, -88(%rbp)
	jmp	.L139
.L138:
	movl	$48, -88(%rbp)
.L139:
	movq	flags(%rip), %rax
	andl	$4, %eax
	testq	%rax, %rax
	je	.L140
	movl	$49, -92(%rbp)
	jmp	.L141
.L140:
	movl	$48, -92(%rbp)
.L141:
	movq	flags(%rip), %rax
	andl	$8, %eax
	testq	%rax, %rax
	je	.L142
	movl	$49, -96(%rbp)
	jmp	.L143
.L142:
	movl	$48, -96(%rbp)
.L143:
	movq	flags(%rip), %rax
	andl	$16, %eax
	testq	%rax, %rax
	je	.L144
	movl	$49, -100(%rbp)
	jmp	.L145
.L144:
	movl	$48, -100(%rbp)
.L145:
	movq	flags(%rip), %rax
	andl	$32, %eax
	testq	%rax, %rax
	je	.L146
	movl	$49, -104(%rbp)
	jmp	.L147
.L146:
	movl	$48, -104(%rbp)
.L147:
	movq	flags(%rip), %rax
	andl	$64, %eax
	testq	%rax, %rax
	je	.L148
	movl	$49, -108(%rbp)
	jmp	.L149
.L148:
	movl	$48, -108(%rbp)
.L149:
	movq	flags(%rip), %rax
	andl	$128, %eax
	testq	%rax, %rax
	je	.L150
	movl	$49, -112(%rbp)
	jmp	.L151
.L150:
	movl	$48, -112(%rbp)
.L151:
	movq	flags(%rip), %rax
	andl	$256, %eax
	testq	%rax, %rax
	je	.L152
	movl	$49, -116(%rbp)
	jmp	.L153
.L152:
	movl	$48, -116(%rbp)
.L153:
	movq	flags(%rip), %rax
	andl	$512, %eax
	testq	%rax, %rax
	je	.L154
	movl	$49, -120(%rbp)
	jmp	.L155
.L154:
	movl	$48, -120(%rbp)
.L155:
	movq	flags(%rip), %rax
	andl	$1024, %eax
	testq	%rax, %rax
	je	.L156
	movl	$49, -124(%rbp)
	jmp	.L157
.L156:
	movl	$48, -124(%rbp)
.L157:
	movq	flags(%rip), %rax
	andl	$2048, %eax
	testq	%rax, %rax
	je	.L158
	movl	$49, -128(%rbp)
	jmp	.L159
.L158:
	movl	$48, -128(%rbp)
.L159:
	movq	flags(%rip), %rax
	andl	$4096, %eax
	testq	%rax, %rax
	je	.L160
	movl	$49, -132(%rbp)
	jmp	.L161
.L160:
	movl	$48, -132(%rbp)
.L161:
	movq	flags(%rip), %rax
	andl	$8192, %eax
	testq	%rax, %rax
	je	.L162
	movl	$49, -136(%rbp)
	jmp	.L163
.L162:
	movl	$48, -136(%rbp)
.L163:
	movq	flags(%rip), %rax
	andl	$16384, %eax
	testq	%rax, %rax
	je	.L164
	movl	$49, -140(%rbp)
	jmp	.L165
.L164:
	movl	$48, -140(%rbp)
.L165:
	movq	flags(%rip), %rax
	andl	$32768, %eax
	testq	%rax, %rax
	je	.L166
	movl	$49, -144(%rbp)
	jmp	.L167
.L166:
	movl	$48, -144(%rbp)
.L167:
	movq	flags(%rip), %rax
	andl	$65536, %eax
	testq	%rax, %rax
	je	.L168
	movl	$49, -148(%rbp)
	jmp	.L169
.L168:
	movl	$48, -148(%rbp)
.L169:
	movq	flags(%rip), %rax
	andl	$131072, %eax
	testq	%rax, %rax
	je	.L170
	movl	$49, -152(%rbp)
	jmp	.L171
.L170:
	movl	$48, -152(%rbp)
.L171:
	movq	flags(%rip), %rax
	andl	$262144, %eax
	testq	%rax, %rax
	je	.L172
	movl	$49, -156(%rbp)
	jmp	.L173
.L172:
	movl	$48, -156(%rbp)
.L173:
	movq	flags(%rip), %rax
	andl	$524288, %eax
	testq	%rax, %rax
	je	.L174
	movl	$49, -160(%rbp)
	jmp	.L175
.L174:
	movl	$48, -160(%rbp)
.L175:
	movq	flags(%rip), %rax
	andl	$1048576, %eax
	testq	%rax, %rax
	je	.L176
	movl	$49, -164(%rbp)
	jmp	.L177
.L176:
	movl	$48, -164(%rbp)
.L177:
	movq	flags(%rip), %rax
	andl	$2097152, %eax
	testq	%rax, %rax
	je	.L178
	movl	$49, -168(%rbp)
	jmp	.L179
.L178:
	movl	$48, -168(%rbp)
.L179:
	movq	flags(%rip), %rax
	andl	$4194304, %eax
	testq	%rax, %rax
	je	.L180
	movl	$49, -172(%rbp)
	jmp	.L181
.L180:
	movl	$48, -172(%rbp)
.L181:
	movq	flags(%rip), %rax
	andl	$8388608, %eax
	testq	%rax, %rax
	je	.L182
	movl	$49, -176(%rbp)
	jmp	.L183
.L182:
	movl	$48, -176(%rbp)
.L183:
	movq	flags(%rip), %rax
	andl	$16777216, %eax
	testq	%rax, %rax
	je	.L184
	movl	$49, -180(%rbp)
	jmp	.L185
.L184:
	movl	$48, -180(%rbp)
.L185:
	movq	flags(%rip), %rax
	andl	$33554432, %eax
	testq	%rax, %rax
	je	.L186
	movl	$49, -184(%rbp)
	jmp	.L187
.L186:
	movl	$48, -184(%rbp)
.L187:
	movq	flags(%rip), %rax
	andl	$67108864, %eax
	testq	%rax, %rax
	je	.L188
	movl	$49, -188(%rbp)
	jmp	.L189
.L188:
	movl	$48, -188(%rbp)
.L189:
	movq	flags(%rip), %rax
	andl	$134217728, %eax
	testq	%rax, %rax
	je	.L190
	movl	$49, -192(%rbp)
	jmp	.L191
.L190:
	movl	$48, -192(%rbp)
.L191:
	movq	flags(%rip), %rax
	andl	$268435456, %eax
	testq	%rax, %rax
	je	.L192
	movl	$49, -196(%rbp)
	jmp	.L193
.L192:
	movl	$48, -196(%rbp)
.L193:
	movq	flags(%rip), %rax
	andl	$536870912, %eax
	testq	%rax, %rax
	je	.L194
	movl	$49, -200(%rbp)
	jmp	.L195
.L194:
	movl	$48, -200(%rbp)
.L195:
	movq	flags(%rip), %rax
	andl	$1073741824, %eax
	testq	%rax, %rax
	je	.L196
	movl	$49, -204(%rbp)
	jmp	.L197
.L196:
	movl	$48, -204(%rbp)
.L197:
	movq	flags(%rip), %rax
	andl	$2147483648, %eax
	testq	%rax, %rax
	je	.L198
	movl	$49, -208(%rbp)
	jmp	.L199
.L198:
	movl	$48, -208(%rbp)
.L199:
	movq	flags(%rip), %rdx
	movabsq	$4294967296, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L200
	movl	$49, -212(%rbp)
	jmp	.L201
.L200:
	movl	$48, -212(%rbp)
.L201:
	movq	flags(%rip), %rdx
	movabsq	$8589934592, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L202
	movl	$49, -216(%rbp)
	jmp	.L203
.L202:
	movl	$48, -216(%rbp)
.L203:
	movq	flags(%rip), %rdx
	movabsq	$17179869184, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L204
	movl	$49, -220(%rbp)
	jmp	.L205
.L204:
	movl	$48, -220(%rbp)
.L205:
	movq	flags(%rip), %rdx
	movabsq	$34359738368, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L206
	movl	$49, -224(%rbp)
	jmp	.L207
.L206:
	movl	$48, -224(%rbp)
.L207:
	movq	flags(%rip), %rdx
	movabsq	$68719476736, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L208
	movl	$49, -228(%rbp)
	jmp	.L209
.L208:
	movl	$48, -228(%rbp)
.L209:
	movq	flags(%rip), %rdx
	movabsq	$137438953472, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L210
	movl	$49, -232(%rbp)
	jmp	.L211
.L210:
	movl	$48, -232(%rbp)
.L211:
	movq	flags(%rip), %rdx
	movabsq	$274877906944, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L212
	movl	$49, -236(%rbp)
	jmp	.L213
.L212:
	movl	$48, -236(%rbp)
.L213:
	movq	flags(%rip), %rdx
	movabsq	$549755813888, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L214
	movl	$49, -240(%rbp)
	jmp	.L215
.L214:
	movl	$48, -240(%rbp)
.L215:
	movq	flags(%rip), %rdx
	movabsq	$1099511627776, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L216
	movl	$49, -244(%rbp)
	jmp	.L217
.L216:
	movl	$48, -244(%rbp)
.L217:
	movq	flags(%rip), %rdx
	movabsq	$2199023255552, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L218
	movl	$49, -248(%rbp)
	jmp	.L219
.L218:
	movl	$48, -248(%rbp)
.L219:
	movq	flags(%rip), %rdx
	movabsq	$4398046511104, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L220
	movl	$49, -252(%rbp)
	jmp	.L221
.L220:
	movl	$48, -252(%rbp)
.L221:
	movq	flags(%rip), %rdx
	movabsq	$8796093022208, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L222
	movl	$49, -256(%rbp)
	jmp	.L223
.L222:
	movl	$48, -256(%rbp)
.L223:
	movq	flags(%rip), %rdx
	movabsq	$17592186044416, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L224
	movl	$49, -260(%rbp)
	jmp	.L225
.L224:
	movl	$48, -260(%rbp)
.L225:
	movq	flags(%rip), %rdx
	movabsq	$35184372088832, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L226
	movl	$49, -264(%rbp)
	jmp	.L227
.L226:
	movl	$48, -264(%rbp)
.L227:
	movq	flags(%rip), %rdx
	movabsq	$70368744177664, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L228
	movl	$49, -268(%rbp)
	jmp	.L229
.L228:
	movl	$48, -268(%rbp)
.L229:
	movq	flags(%rip), %rdx
	movabsq	$140737488355328, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L230
	movl	$49, -272(%rbp)
	jmp	.L231
.L230:
	movl	$48, -272(%rbp)
.L231:
	movq	flags(%rip), %rdx
	movabsq	$281474976710656, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L232
	movl	$49, -276(%rbp)
	jmp	.L233
.L232:
	movl	$48, -276(%rbp)
.L233:
	movq	flags(%rip), %rdx
	movabsq	$562949953421312, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L234
	movl	$49, -280(%rbp)
	jmp	.L235
.L234:
	movl	$48, -280(%rbp)
.L235:
	movq	flags(%rip), %rdx
	movabsq	$1125899906842624, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L236
	movl	$49, %r15d
	jmp	.L237
.L236:
	movl	$48, %r15d
.L237:
	movq	flags(%rip), %rdx
	movabsq	$2251799813685248, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L238
	movl	$49, %r14d
	jmp	.L239
.L238:
	movl	$48, %r14d
.L239:
	movq	flags(%rip), %rdx
	movabsq	$4503599627370496, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L240
	movl	$49, %r13d
	jmp	.L241
.L240:
	movl	$48, %r13d
.L241:
	movq	flags(%rip), %rdx
	movabsq	$9007199254740992, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L242
	movl	$49, %r12d
	jmp	.L243
.L242:
	movl	$48, %r12d
.L243:
	movq	flags(%rip), %rdx
	movabsq	$18014398509481984, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L244
	movl	$49, %ebx
	jmp	.L245
.L244:
	movl	$48, %ebx
.L245:
	movq	flags(%rip), %rdx
	movabsq	$36028797018963968, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L246
	movl	$49, %r11d
	jmp	.L247
.L246:
	movl	$48, %r11d
.L247:
	movq	flags(%rip), %rdx
	movabsq	$72057594037927936, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L248
	movl	$49, %r9d
	jmp	.L249
.L248:
	movl	$48, %r9d
.L249:
	movq	flags(%rip), %rdx
	movabsq	$144115188075855872, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L250
	movl	$49, %r8d
	jmp	.L251
.L250:
	movl	$48, %r8d
.L251:
	movq	flags(%rip), %rdx
	movabsq	$288230376151711744, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L252
	movl	$49, %esi
	jmp	.L253
.L252:
	movl	$48, %esi
.L253:
	movq	flags(%rip), %rdx
	movabsq	$576460752303423488, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L254
	movl	$49, %r10d
	jmp	.L255
.L254:
	movl	$48, %r10d
.L255:
	movq	flags(%rip), %rdx
	movabsq	$1152921504606846976, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L256
	movl	$49, %edi
	jmp	.L257
.L256:
	movl	$48, %edi
.L257:
	movq	flags(%rip), %rdx
	movabsq	$2305843009213693952, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L258
	movl	$49, %ecx
	jmp	.L259
.L258:
	movl	$48, %ecx
.L259:
	movq	flags(%rip), %rdx
	movabsq	$4611686018427387904, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L260
	movl	$49, %edx
	jmp	.L261
.L260:
	movl	$48, %edx
.L261:
	movq	flags(%rip), %rax
	testq	%rax, %rax
	jns	.L262
	movl	$49, -284(%rbp)
	jmp	.L263
.L262:
	movl	$48, -284(%rbp)
.L263:
	subq	$8, %rsp
	movl	-84(%rbp), %eax
	pushq	%rax
	movl	-88(%rbp), %eax
	pushq	%rax
	movl	-92(%rbp), %eax
	pushq	%rax
	movl	-96(%rbp), %eax
	pushq	%rax
	movl	-100(%rbp), %eax
	pushq	%rax
	movl	-104(%rbp), %eax
	pushq	%rax
	movl	-108(%rbp), %eax
	pushq	%rax
	movl	-112(%rbp), %eax
	pushq	%rax
	movl	-116(%rbp), %eax
	pushq	%rax
	movl	-120(%rbp), %eax
	pushq	%rax
	movl	-124(%rbp), %eax
	pushq	%rax
	movl	-128(%rbp), %eax
	pushq	%rax
	movl	-132(%rbp), %eax
	pushq	%rax
	movl	-136(%rbp), %eax
	pushq	%rax
	movl	-140(%rbp), %eax
	pushq	%rax
	movl	-144(%rbp), %eax
	pushq	%rax
	movl	-148(%rbp), %eax
	pushq	%rax
	movl	-152(%rbp), %eax
	pushq	%rax
	movl	-156(%rbp), %eax
	pushq	%rax
	movl	-160(%rbp), %eax
	pushq	%rax
	movl	-164(%rbp), %eax
	pushq	%rax
	movl	-168(%rbp), %eax
	pushq	%rax
	movl	-172(%rbp), %eax
	pushq	%rax
	movl	-176(%rbp), %eax
	pushq	%rax
	movl	-180(%rbp), %eax
	pushq	%rax
	movl	-184(%rbp), %eax
	pushq	%rax
	movl	-188(%rbp), %eax
	pushq	%rax
	movl	-192(%rbp), %eax
	pushq	%rax
	movl	-196(%rbp), %eax
	pushq	%rax
	movl	-200(%rbp), %eax
	pushq	%rax
	movl	-204(%rbp), %eax
	pushq	%rax
	movl	-208(%rbp), %eax
	pushq	%rax
	movl	-212(%rbp), %eax
	pushq	%rax
	movl	-216(%rbp), %eax
	pushq	%rax
	movl	-220(%rbp), %eax
	pushq	%rax
	movl	-224(%rbp), %eax
	pushq	%rax
	movl	-228(%rbp), %eax
	pushq	%rax
	movl	-232(%rbp), %eax
	pushq	%rax
	movl	-236(%rbp), %eax
	pushq	%rax
	movl	-240(%rbp), %eax
	pushq	%rax
	movl	-244(%rbp), %eax
	pushq	%rax
	movl	-248(%rbp), %eax
	pushq	%rax
	movl	-252(%rbp), %eax
	pushq	%rax
	movl	-256(%rbp), %eax
	pushq	%rax
	movl	-260(%rbp), %eax
	pushq	%rax
	movl	-264(%rbp), %eax
	pushq	%rax
	movl	-268(%rbp), %eax
	pushq	%rax
	movl	-272(%rbp), %eax
	pushq	%rax
	movl	-276(%rbp), %eax
	pushq	%rax
	movl	-280(%rbp), %eax
	pushq	%rax
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%r11
	pushq	%r9
	pushq	%r8
	pushq	%rsi
	movl	%r10d, %r9d
	movl	%edi, %r8d
	movl	-284(%rbp), %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$480, %rsp
	movq	disco(%rip), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L264
	movl	$49, -84(%rbp)
	jmp	.L265
.L264:
	movl	$48, -84(%rbp)
.L265:
	movq	disco(%rip), %rax
	andl	$2, %eax
	testq	%rax, %rax
	je	.L266
	movl	$49, -88(%rbp)
	jmp	.L267
.L266:
	movl	$48, -88(%rbp)
.L267:
	movq	disco(%rip), %rax
	andl	$4, %eax
	testq	%rax, %rax
	je	.L268
	movl	$49, -92(%rbp)
	jmp	.L269
.L268:
	movl	$48, -92(%rbp)
.L269:
	movq	disco(%rip), %rax
	andl	$8, %eax
	testq	%rax, %rax
	je	.L270
	movl	$49, -96(%rbp)
	jmp	.L271
.L270:
	movl	$48, -96(%rbp)
.L271:
	movq	disco(%rip), %rax
	andl	$16, %eax
	testq	%rax, %rax
	je	.L272
	movl	$49, -100(%rbp)
	jmp	.L273
.L272:
	movl	$48, -100(%rbp)
.L273:
	movq	disco(%rip), %rax
	andl	$32, %eax
	testq	%rax, %rax
	je	.L274
	movl	$49, -104(%rbp)
	jmp	.L275
.L274:
	movl	$48, -104(%rbp)
.L275:
	movq	disco(%rip), %rax
	andl	$64, %eax
	testq	%rax, %rax
	je	.L276
	movl	$49, -108(%rbp)
	jmp	.L277
.L276:
	movl	$48, -108(%rbp)
.L277:
	movq	disco(%rip), %rax
	andl	$128, %eax
	testq	%rax, %rax
	je	.L278
	movl	$49, -112(%rbp)
	jmp	.L279
.L278:
	movl	$48, -112(%rbp)
.L279:
	movq	disco(%rip), %rax
	andl	$256, %eax
	testq	%rax, %rax
	je	.L280
	movl	$49, -116(%rbp)
	jmp	.L281
.L280:
	movl	$48, -116(%rbp)
.L281:
	movq	disco(%rip), %rax
	andl	$512, %eax
	testq	%rax, %rax
	je	.L282
	movl	$49, -120(%rbp)
	jmp	.L283
.L282:
	movl	$48, -120(%rbp)
.L283:
	movq	disco(%rip), %rax
	andl	$1024, %eax
	testq	%rax, %rax
	je	.L284
	movl	$49, -124(%rbp)
	jmp	.L285
.L284:
	movl	$48, -124(%rbp)
.L285:
	movq	disco(%rip), %rax
	andl	$2048, %eax
	testq	%rax, %rax
	je	.L286
	movl	$49, -128(%rbp)
	jmp	.L287
.L286:
	movl	$48, -128(%rbp)
.L287:
	movq	disco(%rip), %rax
	andl	$4096, %eax
	testq	%rax, %rax
	je	.L288
	movl	$49, -132(%rbp)
	jmp	.L289
.L288:
	movl	$48, -132(%rbp)
.L289:
	movq	disco(%rip), %rax
	andl	$8192, %eax
	testq	%rax, %rax
	je	.L290
	movl	$49, -136(%rbp)
	jmp	.L291
.L290:
	movl	$48, -136(%rbp)
.L291:
	movq	disco(%rip), %rax
	andl	$16384, %eax
	testq	%rax, %rax
	je	.L292
	movl	$49, -140(%rbp)
	jmp	.L293
.L292:
	movl	$48, -140(%rbp)
.L293:
	movq	disco(%rip), %rax
	andl	$32768, %eax
	testq	%rax, %rax
	je	.L294
	movl	$49, -144(%rbp)
	jmp	.L295
.L294:
	movl	$48, -144(%rbp)
.L295:
	movq	disco(%rip), %rax
	andl	$65536, %eax
	testq	%rax, %rax
	je	.L296
	movl	$49, -148(%rbp)
	jmp	.L297
.L296:
	movl	$48, -148(%rbp)
.L297:
	movq	disco(%rip), %rax
	andl	$131072, %eax
	testq	%rax, %rax
	je	.L298
	movl	$49, -152(%rbp)
	jmp	.L299
.L298:
	movl	$48, -152(%rbp)
.L299:
	movq	disco(%rip), %rax
	andl	$262144, %eax
	testq	%rax, %rax
	je	.L300
	movl	$49, -156(%rbp)
	jmp	.L301
.L300:
	movl	$48, -156(%rbp)
.L301:
	movq	disco(%rip), %rax
	andl	$524288, %eax
	testq	%rax, %rax
	je	.L302
	movl	$49, -160(%rbp)
	jmp	.L303
.L302:
	movl	$48, -160(%rbp)
.L303:
	movq	disco(%rip), %rax
	andl	$1048576, %eax
	testq	%rax, %rax
	je	.L304
	movl	$49, -164(%rbp)
	jmp	.L305
.L304:
	movl	$48, -164(%rbp)
.L305:
	movq	disco(%rip), %rax
	andl	$2097152, %eax
	testq	%rax, %rax
	je	.L306
	movl	$49, -168(%rbp)
	jmp	.L307
.L306:
	movl	$48, -168(%rbp)
.L307:
	movq	disco(%rip), %rax
	andl	$4194304, %eax
	testq	%rax, %rax
	je	.L308
	movl	$49, -172(%rbp)
	jmp	.L309
.L308:
	movl	$48, -172(%rbp)
.L309:
	movq	disco(%rip), %rax
	andl	$8388608, %eax
	testq	%rax, %rax
	je	.L310
	movl	$49, -176(%rbp)
	jmp	.L311
.L310:
	movl	$48, -176(%rbp)
.L311:
	movq	disco(%rip), %rax
	andl	$16777216, %eax
	testq	%rax, %rax
	je	.L312
	movl	$49, -180(%rbp)
	jmp	.L313
.L312:
	movl	$48, -180(%rbp)
.L313:
	movq	disco(%rip), %rax
	andl	$33554432, %eax
	testq	%rax, %rax
	je	.L314
	movl	$49, -184(%rbp)
	jmp	.L315
.L314:
	movl	$48, -184(%rbp)
.L315:
	movq	disco(%rip), %rax
	andl	$67108864, %eax
	testq	%rax, %rax
	je	.L316
	movl	$49, -188(%rbp)
	jmp	.L317
.L316:
	movl	$48, -188(%rbp)
.L317:
	movq	disco(%rip), %rax
	andl	$134217728, %eax
	testq	%rax, %rax
	je	.L318
	movl	$49, -192(%rbp)
	jmp	.L319
.L318:
	movl	$48, -192(%rbp)
.L319:
	movq	disco(%rip), %rax
	andl	$268435456, %eax
	testq	%rax, %rax
	je	.L320
	movl	$49, -196(%rbp)
	jmp	.L321
.L320:
	movl	$48, -196(%rbp)
.L321:
	movq	disco(%rip), %rax
	andl	$536870912, %eax
	testq	%rax, %rax
	je	.L322
	movl	$49, -200(%rbp)
	jmp	.L323
.L322:
	movl	$48, -200(%rbp)
.L323:
	movq	disco(%rip), %rax
	andl	$1073741824, %eax
	testq	%rax, %rax
	je	.L324
	movl	$49, -204(%rbp)
	jmp	.L325
.L324:
	movl	$48, -204(%rbp)
.L325:
	movq	disco(%rip), %rax
	andl	$2147483648, %eax
	testq	%rax, %rax
	je	.L326
	movl	$49, -208(%rbp)
	jmp	.L327
.L326:
	movl	$48, -208(%rbp)
.L327:
	movq	disco(%rip), %rdx
	movabsq	$4294967296, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L328
	movl	$49, -212(%rbp)
	jmp	.L329
.L328:
	movl	$48, -212(%rbp)
.L329:
	movq	disco(%rip), %rdx
	movabsq	$8589934592, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L330
	movl	$49, -216(%rbp)
	jmp	.L331
.L330:
	movl	$48, -216(%rbp)
.L331:
	movq	disco(%rip), %rdx
	movabsq	$17179869184, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L332
	movl	$49, -220(%rbp)
	jmp	.L333
.L332:
	movl	$48, -220(%rbp)
.L333:
	movq	disco(%rip), %rdx
	movabsq	$34359738368, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L334
	movl	$49, -224(%rbp)
	jmp	.L335
.L334:
	movl	$48, -224(%rbp)
.L335:
	movq	disco(%rip), %rdx
	movabsq	$68719476736, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L336
	movl	$49, -228(%rbp)
	jmp	.L337
.L336:
	movl	$48, -228(%rbp)
.L337:
	movq	disco(%rip), %rdx
	movabsq	$137438953472, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L338
	movl	$49, -232(%rbp)
	jmp	.L339
.L338:
	movl	$48, -232(%rbp)
.L339:
	movq	disco(%rip), %rdx
	movabsq	$274877906944, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L340
	movl	$49, -236(%rbp)
	jmp	.L341
.L340:
	movl	$48, -236(%rbp)
.L341:
	movq	disco(%rip), %rdx
	movabsq	$549755813888, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L342
	movl	$49, -240(%rbp)
	jmp	.L343
.L342:
	movl	$48, -240(%rbp)
.L343:
	movq	disco(%rip), %rdx
	movabsq	$1099511627776, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L344
	movl	$49, -244(%rbp)
	jmp	.L345
.L344:
	movl	$48, -244(%rbp)
.L345:
	movq	disco(%rip), %rdx
	movabsq	$2199023255552, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L346
	movl	$49, -248(%rbp)
	jmp	.L347
.L346:
	movl	$48, -248(%rbp)
.L347:
	movq	disco(%rip), %rdx
	movabsq	$4398046511104, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L348
	movl	$49, -252(%rbp)
	jmp	.L349
.L348:
	movl	$48, -252(%rbp)
.L349:
	movq	disco(%rip), %rdx
	movabsq	$8796093022208, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L350
	movl	$49, -256(%rbp)
	jmp	.L351
.L350:
	movl	$48, -256(%rbp)
.L351:
	movq	disco(%rip), %rdx
	movabsq	$17592186044416, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L352
	movl	$49, -260(%rbp)
	jmp	.L353
.L352:
	movl	$48, -260(%rbp)
.L353:
	movq	disco(%rip), %rdx
	movabsq	$35184372088832, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L354
	movl	$49, -264(%rbp)
	jmp	.L355
.L354:
	movl	$48, -264(%rbp)
.L355:
	movq	disco(%rip), %rdx
	movabsq	$70368744177664, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L356
	movl	$49, -268(%rbp)
	jmp	.L357
.L356:
	movl	$48, -268(%rbp)
.L357:
	movq	disco(%rip), %rdx
	movabsq	$140737488355328, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L358
	movl	$49, -272(%rbp)
	jmp	.L359
.L358:
	movl	$48, -272(%rbp)
.L359:
	movq	disco(%rip), %rdx
	movabsq	$281474976710656, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L360
	movl	$49, -276(%rbp)
	jmp	.L361
.L360:
	movl	$48, -276(%rbp)
.L361:
	movq	disco(%rip), %rdx
	movabsq	$562949953421312, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L362
	movl	$49, -280(%rbp)
	jmp	.L363
.L362:
	movl	$48, -280(%rbp)
.L363:
	movq	disco(%rip), %rdx
	movabsq	$1125899906842624, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L364
	movl	$49, %r15d
	jmp	.L365
.L364:
	movl	$48, %r15d
.L365:
	movq	disco(%rip), %rdx
	movabsq	$2251799813685248, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L366
	movl	$49, %r14d
	jmp	.L367
.L366:
	movl	$48, %r14d
.L367:
	movq	disco(%rip), %rdx
	movabsq	$4503599627370496, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L368
	movl	$49, %r13d
	jmp	.L369
.L368:
	movl	$48, %r13d
.L369:
	movq	disco(%rip), %rdx
	movabsq	$9007199254740992, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L370
	movl	$49, %r12d
	jmp	.L371
.L370:
	movl	$48, %r12d
.L371:
	movq	disco(%rip), %rdx
	movabsq	$18014398509481984, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L372
	movl	$49, %ebx
	jmp	.L373
.L372:
	movl	$48, %ebx
.L373:
	movq	disco(%rip), %rdx
	movabsq	$36028797018963968, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L374
	movl	$49, %r11d
	jmp	.L375
.L374:
	movl	$48, %r11d
.L375:
	movq	disco(%rip), %rdx
	movabsq	$72057594037927936, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L376
	movl	$49, %r9d
	jmp	.L377
.L376:
	movl	$48, %r9d
.L377:
	movq	disco(%rip), %rdx
	movabsq	$144115188075855872, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L378
	movl	$49, %r8d
	jmp	.L379
.L378:
	movl	$48, %r8d
.L379:
	movq	disco(%rip), %rdx
	movabsq	$288230376151711744, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L380
	movl	$49, %esi
	jmp	.L381
.L380:
	movl	$48, %esi
.L381:
	movq	disco(%rip), %rdx
	movabsq	$576460752303423488, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L382
	movl	$49, %r10d
	jmp	.L383
.L382:
	movl	$48, %r10d
.L383:
	movq	disco(%rip), %rdx
	movabsq	$1152921504606846976, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L384
	movl	$49, %edi
	jmp	.L385
.L384:
	movl	$48, %edi
.L385:
	movq	disco(%rip), %rdx
	movabsq	$2305843009213693952, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L386
	movl	$49, %ecx
	jmp	.L387
.L386:
	movl	$48, %ecx
.L387:
	movq	disco(%rip), %rdx
	movabsq	$4611686018427387904, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	je	.L388
	movl	$49, %edx
	jmp	.L389
.L388:
	movl	$48, %edx
.L389:
	movq	disco(%rip), %rax
	testq	%rax, %rax
	jns	.L390
	movl	$49, -284(%rbp)
	jmp	.L391
.L390:
	movl	$48, -284(%rbp)
.L391:
	subq	$8, %rsp
	movl	-84(%rbp), %eax
	pushq	%rax
	movl	-88(%rbp), %eax
	pushq	%rax
	movl	-92(%rbp), %eax
	pushq	%rax
	movl	-96(%rbp), %eax
	pushq	%rax
	movl	-100(%rbp), %eax
	pushq	%rax
	movl	-104(%rbp), %eax
	pushq	%rax
	movl	-108(%rbp), %eax
	pushq	%rax
	movl	-112(%rbp), %eax
	pushq	%rax
	movl	-116(%rbp), %eax
	pushq	%rax
	movl	-120(%rbp), %eax
	pushq	%rax
	movl	-124(%rbp), %eax
	pushq	%rax
	movl	-128(%rbp), %eax
	pushq	%rax
	movl	-132(%rbp), %eax
	pushq	%rax
	movl	-136(%rbp), %eax
	pushq	%rax
	movl	-140(%rbp), %eax
	pushq	%rax
	movl	-144(%rbp), %eax
	pushq	%rax
	movl	-148(%rbp), %eax
	pushq	%rax
	movl	-152(%rbp), %eax
	pushq	%rax
	movl	-156(%rbp), %eax
	pushq	%rax
	movl	-160(%rbp), %eax
	pushq	%rax
	movl	-164(%rbp), %eax
	pushq	%rax
	movl	-168(%rbp), %eax
	pushq	%rax
	movl	-172(%rbp), %eax
	pushq	%rax
	movl	-176(%rbp), %eax
	pushq	%rax
	movl	-180(%rbp), %eax
	pushq	%rax
	movl	-184(%rbp), %eax
	pushq	%rax
	movl	-188(%rbp), %eax
	pushq	%rax
	movl	-192(%rbp), %eax
	pushq	%rax
	movl	-196(%rbp), %eax
	pushq	%rax
	movl	-200(%rbp), %eax
	pushq	%rax
	movl	-204(%rbp), %eax
	pushq	%rax
	movl	-208(%rbp), %eax
	pushq	%rax
	movl	-212(%rbp), %eax
	pushq	%rax
	movl	-216(%rbp), %eax
	pushq	%rax
	movl	-220(%rbp), %eax
	pushq	%rax
	movl	-224(%rbp), %eax
	pushq	%rax
	movl	-228(%rbp), %eax
	pushq	%rax
	movl	-232(%rbp), %eax
	pushq	%rax
	movl	-236(%rbp), %eax
	pushq	%rax
	movl	-240(%rbp), %eax
	pushq	%rax
	movl	-244(%rbp), %eax
	pushq	%rax
	movl	-248(%rbp), %eax
	pushq	%rax
	movl	-252(%rbp), %eax
	pushq	%rax
	movl	-256(%rbp), %eax
	pushq	%rax
	movl	-260(%rbp), %eax
	pushq	%rax
	movl	-264(%rbp), %eax
	pushq	%rax
	movl	-268(%rbp), %eax
	pushq	%rax
	movl	-272(%rbp), %eax
	pushq	%rax
	movl	-276(%rbp), %eax
	pushq	%rax
	movl	-280(%rbp), %eax
	pushq	%rax
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%r11
	pushq	%r9
	pushq	%r8
	pushq	%rsi
	movl	%r10d, %r9d
	movl	%edi, %r8d
	movl	-284(%rbp), %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$480, %rsp
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	x(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	y(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	bombs(%rip), %rdx
	movl	y(%rip), %eax
	leal	0(,%rax,8), %ecx
	movl	x(%rip), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L392
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L392:
	movl	y(%rip), %eax
	leal	0(,%rax,8), %edx
	movl	x(%rip), %eax
	addl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	disco(%rip), %rax
	orq	%rdx, %rax
	movq	%rax, disco(%rip)
	jmp	.L393
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
