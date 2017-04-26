section .text
	global _ft_isprint

_ft_isprint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	cmp rdi, 32
	jl end
	cmp rdi, 126
	jg end
	mov rax, 1

end:
	leave
	ret
