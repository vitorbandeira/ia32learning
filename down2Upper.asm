section .data
	message db	'Tell me your name:'
	message_size	EQU	$-message
	full_message db	'Your upper name is:'
	full_message_size	EQU	$-full_message
	new_line	db	0Dh, 0Ah
	new_line_size	EQU	$-new_line
section .bss
	name	resb	16

section .text
global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, message	; print welcome message
	mov edx, message_size
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, name		; get user name
	mov edx, 16
	int 80h


toUpper:
	cmp byte [ecx],0	; verify if current character is null
	jz fim
	cmp byte [ecx],13
	jz fim

	sub byte [ecx], 32	; transform in upper character
	inc ecx				; get next character
	jmp toUpper
fim:
	mov eax, 4
	mov ebx, 1
	mov ecx, full_message	; print upper name
	mov edx, full_message_size
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, name		; print upper name
	mov edx, 16
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line	; print upper name
	mov edx, new_line_size
	int 80h

	mov eax, 1			; sys_exit
	mov ebx, 0
	int 80h


