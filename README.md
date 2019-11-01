## Install NASM mounter
  `sudo apt-get install nasm`
## Runnnig a ia32 program
  Run the following command for mount, link e execute de program:
  
  `nasm -f elf -o example.o <asmFile>.asm && ld -m elf_i386 -o example example.o && ./example`
