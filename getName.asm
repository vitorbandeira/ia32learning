section .data	; Dados com valor inicial
	question	db 'Digite seu nome: ', 0dH, 0ah
	question_size	EQU	$-question

	full_message	db	'O seu nome eh:'
	full_message_size	EQU	$-full_message

section .bss	; Dados sem valor inicial
name	resb	16


section .text	; Code section
global _start
_start:
		mov eax, 4
		mov ebx, 1
		mov ecx, question
		mov edx, question_size
		int 80h

		mov eax, 3
		mov ebx, 0
		mov ecx, name
		mov edx, 16
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, full_message
		mov edx, full_message_size
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, name
		mov edx, 16
		int 80h

		mov eax, 1
		mov ebx, 0
		int 80h