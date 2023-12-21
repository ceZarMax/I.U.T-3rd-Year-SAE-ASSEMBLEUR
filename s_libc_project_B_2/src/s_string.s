.text
.global s_strlen
s_strlen:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %esi # @ de début de la chaine
	xorl %eax, %eax
sum_loop:
	movb (%esi,%eax), %dl
	cmpb $0, %dl
	jz end_sum_loop
	incl %eax
	jmp sum_loop
end_sum_loop:
	pop %ebp
	ret
