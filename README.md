# AssemblyExamples

## Introduction

Assembly files have the .asm extension, the goal is to turn these into an executable binary file with the .o extension 

## Running Examples

1. Assemble the .asm file into an object .o file by running `nasm -f macho64 [FILE_NAME].asm`

2. Link the [FILE_NAME].o file and turn into an executable named '[FILE_NAME]', by running `ld -macosx_version_min 10.7.0 -o [FILE_NAME] [FILE_NAME].o`

3. Run the program by running `./[FILE_NAME]`

## Reading compiled binary
Once you have assembled the assembly (.asm) file into and object (.o) file you can run `hexdump -C [FILE_NAME].o` to dump out the binary representation

## Registers

Three main areas defined in a assembly program
1. Code - Contains all the instructions to be executed
2. Data - Contains data, constants and work areas
3. Stack - It contains data and return addresses of procedures and subroutines

## System
64-bit OSX is the system I'm running on. It has a similar kernel calling convention to 64-bit linux.

Section A.2 AMD64 Linux Kernal Conventions
1. User-level applications use as integer registers for passing the sequence %rdi, %rsi, %rdx, %rcx, %r8 and %r9. The kernel interface uses %rdi, %rsi, %rdx, %r10, %r8 and %r9.
2. A system-call is done via the syscall instruction. The kernel destroys registers %rcx and %r11.
3. The number of the syscall has to be passed in register %rax.
4. System-calls are limited to six arguments, no argument is passed directly on the stack.
5. Returning from the syscall, register %rax contains the result of the system-call. A value in the range between -4095 and -1 indicates an error, it is -errno.
6. Only values of class INTEGER or class MEMORY are passed to the kernel.

## Addressing

There are three main types of addressing

1. Register Addressing e.g. MOV DX, TAX_RATE		; Register in first operand (fastest way)
2. Immediate Addressing e.g. BYTE_VALUE DB 150  	; A byte value is defined
3. Direct Memory Addressing e.g. MOV BX, WORD_VALUE 	; Operand from memory is added to the register

## Variables

Allocating storage space for initalized data (define directive)

Five basic forms of the define directive
1. DB (Define Byte) - allocates 1 byte
2. DW (Define Word) - allocates 2 bytes
3. DD (Define Doubleword) - allocates 4 bytes
4. DQ (Define Quadword) - allocates 8 bytes
5. DT (Define Ten Bytes) - allocates 10 bytes

Allocating storage space for uninitalized data (reserve directive)

Five basic forms of the reserve directive
1. RESB - Reserve a byte
2. RESW - Reserve a word
3. RESD - Reserve a doubleword
4. RESQ - Reserve a quadword
5. REST - Reserve a ten bytes

TIMES directive allows multiple initalizations to the same value. Useful when initalizing arrays and tables

## Logical Instructions

- XORing an operand with itself changes the operand to 0. This is used to clear a register
- AND operation can be used to clear one or more bits e.g. if you need to clear the higher order bits to zero, you AND it with 0x0F (00001111)

## Conditional Instructions

1. Unconditional jump - JMP [LABEL]
2. Conditioonal jump - J__ [LABEL] e.g. JE (jump if equal) or JLE (jump if less than or equal) 

## Hardware level
Three main components
1. CPU - The function of the CPU is to put the value stored in the register into various arithmetric units for processing
2. Memory - The function of memory is to store most of the variables not involved in the operation, then import them into the register when needed 
3. Hard Disk - The function of the hard disk is to store data when there is no power, once the program is running the data in the hard disk is loaded into memory and participates in the calculation in the CPU
