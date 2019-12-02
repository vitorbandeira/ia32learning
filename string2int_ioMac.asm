%include "io.mac"
.DATA
  message db 'Digite um número com mais de um algarismo:', 0Dh, 0Ah

.UDATA
  result32 resd 1

.CODE
  .STARTUP
  PutStr message
  GetInt ax

  mov bx, 2
  imul bx ; ax * bx
mult:
  mov word [result32], ax
  mov word [result32+2], dx ; result = dx, ax

result:
  PutLInt [result32]

.EXIT

