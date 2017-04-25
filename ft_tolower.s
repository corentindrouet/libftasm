section .text
	global _ft_tolower
	extern _ft_isalpha

_ft_tolower:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	call _ft_isalpha
	mov rax, rdi
	cmp rax, 0
	je end
	cmp rdi, 'A'
	jge isupper
	jmp end

isupper:
	cmp rdi, 'Z'
	jle endcorrect
	jmp end

endcorrect:
	add rdi, 32
	mov rax, rdi
	leave
	ret

end:
	leave
	ret
