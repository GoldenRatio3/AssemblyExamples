# AssemblyExamples

## Introduction

Assembly files have the .asm extension, the goal is to turn into an executable binary file with the .o extension 

## Running Examples

1. Assemble the .asm file into an object .o file by running `nasm -f macho64 [FILE_NAME].asm`

2. Link the [FILE_NAME].o file and turn into an executable named '[FILE_NAME]', by running `ld -macosx_version_min 10.7.0 -o [FILE_NAME] [FILE_NAME].o`

3. Run the program by running `./[FILE_NAME]`

## Reading compiled binary
Once you have assembled the assembly (.asm) file into and object (.o) file you can run `hexdump -C [FILE_NAME].o` to out the binary representation

## Registers

Three main areas defined in a assembly program
1. Code - Contains all the instructions to be executed
2. Data - Contains data, constants and work areas
3. Stack - It contains data and return addresses of procedures and subroutines

## System
64-bit OSX is the system I am running on. It has a similar kernel calling convention to 64-bit linux.

Section A.2 AMD64 Linux Kernal Conventions
1. User-level applications use as integer registers for passing the sequence %rdi, %rsi, %rdx, %rcx, %r8 and %r9. The kernel interface uses %rdi, %rsi, %rdx, %r10, %r8 and %r9.
2. A system-call is done via the syscall instruction. The kernel destroys registers %rcx and %r11.
3. The number of the syscall has to be passed in register %rax.
4. System-calls are limited to six arguments, no argument is passed directly on the stack.
5. Returning from the syscall, register %rax contains the result of the system-call. A value in the range between -4095 and -1 indicates an error, it is -errno.
6. Only values of class INTEGER or class MEMORY are passed to the kernel.

