section .text
	global _ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	xor rax, rax
	cmp rdi, 0
	je end
	xor rcx, rcx
	dec rcx
	cld
	repne scasb
	inc rcx
	not rcx
	mov rax, rcx

end:
	leave
	ret
