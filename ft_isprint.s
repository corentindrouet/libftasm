section .text
	global _ft_isprint

_ft_isprint:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	jmp test_min

test_min:
	cmp rdi, 32
	jge test_max
	jmp end

test_max:
	cmp rdi, 126
	jle endcorrect
	jmp end

endcorrect:
	mov rax, 1
	leave
	ret

end:
	leave
	ret
