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
	cmp edi, 'A'
	jl endincorrect
	cmp edi, 'Z'
	jg endincorrect
	pop rdi
	add edi, 32
	mov rax, rdi
	jmp end

endincorrect:
	pop rax

end:
	leave
	ret
