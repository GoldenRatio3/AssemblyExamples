section .text
  global start

start:
  ; writing the name 'Bradley Winter'
  mov rax,0x02000004
  mov rdi,1
  mov rsi,name
  mov rdx,24
  syscall

  ; Writing the name test
  mov rax,0x02000004
  mov rdi,1 
  mov rdx,6
  mov rsi,fullName
  syscall
 
  ; exit
  mov rax,0x02000001
  xor rdi,rdi
  syscall

section .data
  name db 'Bradley Winter',13,10
  fullName db 'test'

