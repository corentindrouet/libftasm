section .text
	global _ft_strcat

_ft_strcat:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	cmp rdi, 0
	je end
	cmp rsi, 0
	je end
	mov rax, rdi
	xor rcx, rcx

lenrdi:
	mov r10, [rdi]
	cmp r10b, 0
	je lenrsi
	inc rdi
	jmp lenrdi

lenrsi:
	mov r10, [rsi + rcx]
	cmp r10b, 0
	je loop_cat
	inc rcx
	jmp lenrsi

loop_cat:
	cmp rcx, 0
	je end
	dec rcx
	mov bl, [rsi + rcx]
	mov [rdi + rcx], bl
	jmp loop_cat

end:
	leave
	ret
