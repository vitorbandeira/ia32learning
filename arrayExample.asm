section .data
	test_marks	dd	90, 50, 70, 94, 81, 40, 67, 55, 60, 73
	numberStudents	EQU	($-test_marks)/4	; mounter counts only bytes
	sum_msg		db	'The sum of test marks is: ', 0
	size_msg	EQU $-sum_msg

section .bss
	sum  	resd	1
	sum_out	resb	10
	size_sum_out resb 1

section .text
global _start
_start:
	mov ecx, numberStudents
	sub eax, eax	; clean eax
	sub	esi, esi	; clean esi
add_loop:
	add eax, [test_marks+ESI*4]
	inc esi
	loop add_loop
	mov [sum], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, size_sum_out
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h