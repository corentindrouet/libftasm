section .text
	global _ft_memcpy

_ft_memcpy:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	cmp rdi, 0
	je end
	cmp rsi, 0
	je end
	cmp rdx, 0
	je end
	xor rcx, rcx
	mov rcx, rdx
	cld
	rep movsb

end:
	pop rax
	leave
	ret
