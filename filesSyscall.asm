section .data
  filename db 'arq_exemplo.txt', 0
  message db 'Escrevendo no arquivo exemplo....', 0
  message_size EQU $-message

section .text
global _start
_start:

  ; Cria e abre aquivo
  mov eax, 8
  mov ebx, filename
  mov ecx, 0700 ; permissões 
  int 80h

  push eax
  ; abrir arquivo
  ;mov eax, 5
  ;mov ebx, filename  ;ponteiro
  ;mov ecx, 0700  ;permissoes

  ; escrever no arquivo gerado
  ;push eax
  ;mov ebx, eax  ; ponteiro do arquivo
  ;mov eax, 4  ; sys_out
  ;mov ecx, message
  ;mov edx, message_size
  ;int 80h

  ; ler do arquivo
  ;mov eax, 3
  ;pop ebx
  ;mov ecx, buff
  ;mov edx, buff_size

  ; fecha arquivo
  mov eax, 6
  pop ebx
  int 80h

fim:
  mov eax, 1
  mov ebx, 0
  int 80h
