all: clean compile execute


clean:
	rm -rf *.out

compile:
	gcc main.c

execute:
	./a.out


asm:
	nasm -felf64 main.asm && ld main.o && ./a.out
