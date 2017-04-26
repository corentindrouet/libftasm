section .text
	global _ft_tolower
	extern _ft_isalpha

_ft_tolower:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rdi
	call _ft_isalpha
	cmp rax, 0
	je endincorrect
	cmp rdi, 'A'
	jl endincorrect
	cmp rdi, 'Z'
	jg endincorrect
	pop rdi
	add rdi, 32
	mov rax, rdi
	jmp end

endincorrect:
	pop rax

end:
	leave
	ret
