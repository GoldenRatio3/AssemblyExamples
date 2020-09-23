section .text
  global start ;must be declared for linker (gcc)

start:			;tell linker entry point
  mov rdx,len 		;message length
  mov rsi,msg		;message to write
  mov rdi,1		;file descriptor (stdout)
  mov rax,0x02000004	;system call number (sys_write)
  syscall		;invoke OS todo the write

  mov rax, 0x02000001	;system call number (sys_exit)
  xor rdi,rdi		;exit code 0
  syscall		;invoke OS to exit

section .data
msg db 'Displaying 9 stars',0xa		;a message
len equ $ - msg				;length of message


