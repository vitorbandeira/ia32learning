%include "io.mac"
.DATA
  op1 db 'Digite o primeiro número: ', 0
  op2 db 'Digite o segundo número: ', 0
  result_msg db 'O resultado é: ',0

.UDATA
  result8 resb 1
  result16 resw 1
  result32 resd 1
.CODE
  .STARTUP

  PutStr op1
  GetInt ax
  cwd
  PutStr op2
  GetInt bx

  idiv bx

  mov word [result16], ax
  PutStr result_msg
  PutInt [result16]
  nwln

.EXIT
