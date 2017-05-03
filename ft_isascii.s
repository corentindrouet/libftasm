section .text
	global _ft_isascii

_ft_isascii:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0

test_min:
	cmp edi, 0
	jl end

test_max:
	cmp edi, 127
	jg end
	mov rax, 1

end:
	leave
	ret
