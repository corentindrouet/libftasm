section .text
	global _ft_strjoin
	extern _ft_strlen
	extern _malloc
	extern _ft_bzero
	extern _ft_strcat

_ft_strjoin:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	cmp rdi, 0
	je endfail
	cmp rsi, 0
	je endfail
	push rdi
	call _ft_strlen
	pop rdi
	xor rcx, rcx
	mov rcx, rax
	lea r10, [rel rdi]
	lea rdi, [rel rsi]
	lea rsi, [rel r10]
	push rdi
	push rcx
	call _ft_strlen
	pop rcx
	pop rdi
	push rdi
	push rsi
	add rcx, rax
	add rcx, 1
	lea r10, [rel rdi]
	mov rdi, rcx
	mov r8, rcx
	call _malloc
	mov rcx, r8
	cmp rax, 0
	je endfail
	lea rdi, [rel rax]
	mov rsi, rcx
	call _ft_bzero
	lea rdi, [rel rax]
	pop rsi
	push rdi
	call _ft_strcat
	pop rdi
	pop rsi
	push rdi
	call _ft_strcat
	pop rdi
	lea rax, [rel rdi]
	leave
	ret

endfail:
	mov rax, 0
	leave
	ret
