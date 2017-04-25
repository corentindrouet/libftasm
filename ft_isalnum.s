section .text
	global _ft_isalnum
	extern _ft_isdigit
	extern _ft_isalpha

_ft_isalnum:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	call _ft_isdigit
	cmp rax, 1
	je endcorrect
	mov rax, 0
	call _ft_isalpha
	cmp rax, 1
	je endcorrect
	mov rax, 0
	jmp end

endcorrect:
	mov rax, 1
	leave
	ret

end:
	leave
	ret
