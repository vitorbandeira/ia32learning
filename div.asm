%include "io.mac"
.DATA
  op1 db 'Digite o primeiro número: ', 0
  op2 db 'Digite o segundo número: ', 0
  result_msg db 'O resultado é: ',0
  mod_msg db 'O resto é: ',0

.UDATA
  result8 resb 1
  result16 resw 1
  result32 resd 1
  mod8 resb 1
  mod16 resw 1
  mod32 resd 1
.CODE
  .STARTUP

  PutStr op1
  GetLInt eax
  cdq
  PutStr op2
  GetLInt ebx

  idiv ebx

  mov dword [result32], eax
  mov dword [mod32], edx
  PutStr result_msg
  PutInt [result32]
  nwln
  PutStr mod_msg
  PutInt [mod32]
  nwln

.EXIT
