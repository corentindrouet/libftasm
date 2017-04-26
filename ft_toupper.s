section .text
	global _ft_toupper
	extern _ft_isalpha

_ft_toupper:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	call _ft_isalpha
	cmp rax, 0
	je endincorrect
	cmp rdi, 'a'
	jl endincorrect
	cmp rdi, 'z'
	jg endincorrect
	pop rdi
	sub rdi, 32
	mov rax, rdi
	jmp end

endincorrect:
	pop rax

end:
	leave
	ret
