section .text
	global _ft_strcat

_ft_strcat:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, rdi
	and r8, 0

lenrdi:
	mov r9, [rdi]
	cmp r9, 0
	je lenrsi
	inc rdi
	jmp lenrdi

lenrsi:
	mov r9, [rsi + r8]
	cmp r9, 0
	je loop_cat
	inc r8
	jmp lenrsi

loop_cat:
	cmp r8, 0
	je end
	dec r8
	mov bl, [rsi + r8]
	mov [rdi + r8], bl
	jmp loop_cat

end:
	leave
	ret
