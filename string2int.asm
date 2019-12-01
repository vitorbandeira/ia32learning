section .data
  message db 'Digite um número com mais de um algarismo', 0Dh, 0Ah
  message_size EQU  $-message

section .bss
  number resb 11

section .text
global _start
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, message
  mov edx, message_size
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, number
  mov edx, 11
  int 80h
aqui:
  mov eax, 0  ; valor inteiro
  mov ebx, 0  ; digito
  mov ecx, 0  ; ponteiro da string
  mov edx, 0  ; buffer para num original
  mov ecx, number
string_to_int:
  mov bl, [ecx]  ; movendo digito char para ser transformado
  ; multiplica por 10
  mov dl, al ; num original
  shl al, 3 ; multiplica por 8
  add al, dl ; soma numero
  add al, dl ; soma numero

  sub bl, 30h  ; digito inteiro já transformado
  add al, bl  ; soma na parcial de eax
incrementa: 
  inc ecx ; anda byte na string
  cmp byte [ecx], 0Ah  ; procura fim da string
  jne string_to_int 

fim:
  mov eax, 1
  mov ebx, 0
  int 80h

