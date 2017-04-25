section .text
	global _ft_isdigit

_ft_isdigit:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov r8, '0'
	jmp start

start:
	cmp rdi, r8
	je endcorrect
	cmp r8, '9'
	je end
	inc r8
	jmp start

endcorrect:
	mov rax, 1
	leave
	ret

end:
	leave
	ret
