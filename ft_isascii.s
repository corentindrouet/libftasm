section .text
	global _ft_isascii

_ft_isascii:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0

test_min:
	cmp rdi, 0
	jl end

test_max:
	cmp rdi, 127
	jg end
	mov rax, 1

end:
	leave
	ret
