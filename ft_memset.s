section .text
	global _ft_memset

_ft_memset:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	xor rax, rax
	cmp rdi, 0
	je end
	push rdi
	mov rax, rsi
	xor rcx, rcx
	mov rcx, rdx
	cld
	rep stosb
	pop rax

end:
	leave
	ret
