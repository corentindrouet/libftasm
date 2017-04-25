section .text
	global _ft_bzero

_ft_bzero:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	jmp start

start:
	cmp rsi, 0
	je end
	mov bl, 0
	dec rsi
	mov [rdi + rsi], bl
	jmp start

end:
	leave
	ret
