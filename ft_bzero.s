section .data

section .text
	global _ft_bzero

_ft_bzero:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov r8, rsi
	xor r9, r9
	mov rsi, rdi
	jmp start

start:
	cmp r9, r8
	jae end
	mov bl, 0
	mov [rsi + r9], bl
	inc r9
	jmp start

end:
	leave
	ret
