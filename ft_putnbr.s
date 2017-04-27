DEFAULT REL
section .bss
	buffer: resq 1

section .text
	global _ft_putnbr

_ft_putnbr:
	push rbp
	mov rbp, rsp
	sub rsp, 16

check_part:
	cmp edi, 0
	jl printneg
	cmp edi, 10
	jge recursiv
	jmp print

recursiv:
	mov r10, rdi
	xor rdx, rdx
	mov rax, rdi
	mov rbx, 10
	idiv rbx
	mov rdi, rax
	push rdx
	call _ft_putnbr
	pop rdi
	call _ft_putnbr
	leave
	ret

printneg:
	mov rax, 0x2000004
	mov r10, '-'
	mov [buffer], r10
	lea rsi, [rel buffer]
	push rdi
	mov rdi, 1
	mov rdx, 1
	syscall
	pop rdi
	neg edi
	jmp check_part

print:
	add rdi, '0'
	mov [buffer], rdi
	mov rdi, 1
	mov rdx, 1
	lea rsi, [rel buffer]
	mov rax, 0x2000004
	syscall
	leave
	ret
