section .text
	global _ft_isalpha

_ft_isalpha:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov r8, 0
	mov r9, 'A'
	jmp startuppercase

startuppercase:
	cmp rdi, r9
	je endcorrect
	cmp r9, 'Z'
	je initlowercase
	inc r9
	jmp startuppercase

initlowercase:
	mov r9, 'a'
	jmp startlowercase

startlowercase:
	cmp rdi, r9
	je endcorrect
	cmp r9, 'z'
	je end
	inc r9
	jmp startlowercase

endcorrect:
	mov rax, 1
	leave
	ret

end:
	leave
	ret
