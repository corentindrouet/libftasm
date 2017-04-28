DEFAULT REL
section .bss
	buff: resq 1
	str: resq 1

section .text
	global _ft_gnl
	extern _ft_strjoin
	extern _malloc
	extern _free
	extern _ft_bzero
	extern _ft_memcpy

_ft_gnl:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rsi
	push rdi
	mov r8, [buff]
	cmp r8, 0
	jne read_file
	mov rdi, 257
	call _malloc
	cmp rax, 0
	je end
	mov [buff], rax

read_file:
	lea rdi, [buff]
	mov rsi, 257
	call _ft_bzero
	mov rax, 0x2000003
	pop rdi
	push rdi
	lea rsi, [buff]
	mov rdx, 256
	add rsp, 16
	syscall
	mov rax, [buff]
	leave
	ret
	sub rsp, 16
	lea rdi, [rel buff]
	xor rcx, rcx
	xor r10, r10

check_new_line:
	mov r10, [rdi + rcx]
	cmp r10b, 0
	je concat_read
	cmp r10b, 10
	je concat_read
	inc rcx
	jmp check_new_line

concat_read:
	push r10
	push rcx
	mov rdi, rcx
	call _malloc
	cmp rax, 0
	lea rdi, [rel rax]
	mov rsi, rcx
	call _ft_bzero
	lea rsi, [rel buff]
	pop rdx
	push rdi
	call _ft_memcpy
	pop rdi
;	mov rax, rdi
;	leave
;	ret
	lea rsi, [rel rdi]
	lea rdi, [rel str]
;	mov rax, [str]
;	lea rax, [rel str]
;	lea rax, [rel rsi]
	call _ft_strjoin
	push rax
	lea rdi, [rel rsi]
	call _free
	lea r8, [rel str]
	cmp r8, 0
	jne continue
	lea rdi, [rel str]
	call _free

continue:
	pop rax
	mov [str], rax

concat:
	pop r10
	cmp r10, 10
	jne read_file
	pop rsi
	mov rsi, [rsi]
	lea rsi, [rel str]

end:
	leave
	ret
