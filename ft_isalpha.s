section .text
	global _ft_isalpha

_ft_isalpha:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov r8, 'A'
	jmp startuppercase

startuppercase:
	cmp rdi, r8
	je endcorrect
	cmp r8, 'Z'
	je initlowercase
	inc r8
	jmp startuppercase

initlowercase:
	mov r8, 'a'
	jmp startlowercase

startlowercase:
	cmp rdi, r8
	je endcorrect
	cmp r8, 'z'
	je end
	inc r8
	jmp startlowercase

endcorrect:
	mov rax, 1
	leave
	ret

end:
	leave
	ret
