section .data				;data segment
  userMsg db 'Please enter a number: '	;Ask the user to enter a number
  lenUserMsg equ $-userMsg		;the length of the message
  dispMsg db 'You have entered: '
  lenDispMsg equ $-dispMsg

section .bss				;uninitialized data
  num resb 5				

section .text				;code segment
  global start

start:
  mov rax,0x02000004			;system call for write
  mov rdi,1				;file handle 1 is stout
  mov rsi,userMsg			;address of string to output
  mov rdx,lenUserMsg			;number of bytes for the message
  syscall				;invoke OS to do the write

  ;Read and store the user input
  mov rax,0x02000003
  mov rdi,2
  mov rsi,num
  mov rdx,5				;5 bytes (numeric, 1 for sign) of that information
  syscall

  ;Output the message 'The entered number is: '
  mov rax,0x02000004
  mov rdi,1
  mov rsi,dispMsg
  mov rdx,lenDispMsg
  syscall

  ;Output the number entered
  mov rax,0x02000004
  mov rdi,1
  mov rsi,num
  mov rdx,5
  syscall

  ;Exit code
  mov rax,0x02000001
  xor rdi,rdi
  syscall



