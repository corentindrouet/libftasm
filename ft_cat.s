section .text
	global _ft_cat
	extern _malloc
	extern _free
	extern _ft_bzero

_ft_cat:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	mov rdi, 257
	push rdi
	call _malloc
	cmp rax, 0
	je endfail
	pop rdi
	push rax

bzerobuff:
	pop rdi
	mov rsi, 257
	call _ft_bzero
	push rdi

read:
	mov rax, 0x2000003
	pop rsi
	lea rsi, [rel rsi]
	pop rdi
	mov rdx, 256
	push rdi
	push rsi
	syscall

write:
	mov rdx, rax
	pop rsi
	push rax
	mov rdi, 1
	mov rax, 0x2000004
	syscall
	pop rax
	push rsi
	cmp rax, 256
	je bzerobuff

end:
	pop rdi
	push rdi
	call _free
	pop rdi
	pop rdi
	leave
	ret

endfail:
	leave
	ret
