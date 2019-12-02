%include "io.mac"
.DATA
  op1 db 'Digite o primeiro número: ', 0
  op2 db 'Digite o segundo número: ', 0
  result_msg db 'O resultado é: ',0

.UDATA
  result32 resd 1

.CODE
  .STARTUP
  PutStr op1
  GetInt ax
  PutStr op2
  GetInt bx

mult:
  imul bx ; ax * bx
  mov word [result32], ax
  mov word [result32+2], dx ; result = dx, ax

result:
  PutStr result_msg
  PutLInt [result32]
  nwln

.EXIT

