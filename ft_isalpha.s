section .text
	global _ft_isalpha

_ft_isalpha:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	jmp verifuppercase

verifuppercase:
	cmp rdi, 'Z'
	jg veriflowercase
	cmp rdi, 'A'
	jge endcorrect
	jmp end

veriflowercase:
	cmp rdi, 'a'
	jl end
	cmp rdi, 'z'
	jle endcorrect
	jmp end

endcorrect:
	mov rax, 1

end:
	leave
	ret
