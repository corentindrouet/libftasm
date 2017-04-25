section .data
	return:
		.string db 10
		.len equ $ - return.string
	fmt:
		.string db "%x", 10, 0
		.len equ $ - fmt.string

section .text
	global _ft_puts
;	extern _printf

_ft_puts:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	xor rdx, rdx
	jmp start

start:
	mov r8, [rdi + rdx]
	cmp r8b, 0
	jz end
	inc rdx
	jmp start

end:
	mov rax, 0x2000004
	lea rsi, [rel rdi]
	mov rdi, 1
	syscall
	mov rax, 0x2000004
	lea rsi, [rel return.string]
	mov rdi, 1
	mov rdx, 1
	syscall
	leave
	ret
