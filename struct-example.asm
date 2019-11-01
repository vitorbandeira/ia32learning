%define	code	0	; offsets
%define	limit	4
%define	registered	8
%define	room	12

section .data
	msg1	db	'Enter the course code: ', 0
	msg1Size	EQU	$-msg1
	msg2	db	'Enter the limit of students: ', 0
	msg2Size	EQU	$-msg2
	msg3	db	'Enter the number of registered students: ', 0
	msg3Size	EQU	$-msg3
	msg4	db	'Enter the room number: ', 0
	msg4Size	EQU	$-msg4

section .bss
	struct	resb	16	; required space for all fiels of struct
	cin		resb	2

section .text
global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, msg1Size
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, cin	; get code from user
	mov edx, 2
	int 80h

	mov ebx, 0
	mov bl, [cin]
	sub bl, 0x30	; get integer value
	mov eax, struct	; struct base pointer
	mov dword	[eax+code], ebx  ; move course code correct struct field

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, msg2Size
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, cin	; get code from user
	mov edx, 2
	int 80h

	mov ebx, 0
	mov bl, [cin]
	sub bl, 0x30	; get integer value
	mov eax, struct
	mov dword	[eax+limit], ebx  ; move limit number of students to correct struct field

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, msg3Size
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, cin	; get code from user
	mov edx, 2
	int 80h

	mov ebx, 0
	mov bl, [cin]
	sub bl, 0x30	; get integer value
	mov eax, struct
	mov dword	[eax+registered], ebx  ;move number of registered students to correct struct field

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, msg2Size
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, cin	; get code from user
	mov edx, 2
	int 80h

	mov ebx, 0
	mov bl, [cin]
	sub bl, 0x30	; get integer value
	mov eax, struct
	mov dword	[eax+room], ebx  ; move room number to correct struct field

	mov eax, 1
	mov ebx, 0
	int 80h