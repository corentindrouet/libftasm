section .text
	global _ft_memcpy

_ft_memcpy:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	xor rcx, rcx
	mov rcx, rdx
	cld
	rep movsb
	pop rax
	leave
	ret
