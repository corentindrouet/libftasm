section .text
	global _ft_isalpha

_ft_isalpha:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	jmp verifuppercase

verifuppercase:
	cmp edi, 'Z'
	jg veriflowercase
	cmp edi, 'A'
	jge endcorrect
	jmp end

veriflowercase:
	cmp edi, 'a'
	jl end
	cmp edi, 'z'
	jle endcorrect
	jmp end

endcorrect:
	mov rax, 1

end:
	leave
	ret
