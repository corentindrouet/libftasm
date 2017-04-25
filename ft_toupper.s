section .text
	global _ft_toupper
	extern _ft_isalpha

_ft_toupper:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	call _ft_isalpha
	mov rax, rdi
	cmp rax, 0
	je end
	cmp rdi, 'a'
	jge islower
	jmp end

islower:
	cmp rdi, 'z'
	jle endcorrect
	jmp end

endcorrect:
	sub rdi, 32
	mov rax, rdi
	leave
	ret

end:
	leave
	ret
