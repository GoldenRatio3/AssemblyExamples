# AssemblyExamples

## Introduction

Assembly files have the .asm extension, the goal is to turn into an executable binary file with the .o extension 

## Running Examples

1. Assemble the .asm file into an object .o file by running `nasm -f macho64 hello_world.asm`

2. Link the hello_world.o file and turn into an executable named 'hello_world', by running `ld -macosx_version_min 10.7.0 -o hello_world hello_world.o`

3. Run hello world program by running `./hello_world`


