section .text
	global _ft_isdigit

_ft_isdigit:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0

start:
	cmp edi, '0'
	jl end
	cmp edi, '9'
	jg end
	mov rax, 1

end:
	leave
	ret
