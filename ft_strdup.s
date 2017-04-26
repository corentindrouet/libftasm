section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_memcpy

_ft_strdup:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	call _ft_strlen
	add rax, 1
	mov rdi, rax
	push rdi
	call _malloc
	pop rdi
	cmp rax, 0
	je end
	sub rdi, 1
	mov rdx, rdi
	mov rdi, rax
	pop rsi
	call _ft_memcpy
	mov bl, 0
	mov [rax + rdx], bl

end:
	leave
	ret
