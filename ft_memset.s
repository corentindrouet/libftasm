section .text
	global _ft_memset

_ft_memset:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	xor rax, rax
	mov rax, rsi
	xor rcx, rcx
	mov rcx, rdx
	cld
	rep stosb
	pop rax
	leave
	ret
