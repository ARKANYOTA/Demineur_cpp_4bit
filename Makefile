CC = g++
CFLAGS = -Wall

main:
	$(CC) $(CFLAGS) main.cpp -o main

clean:
	rm -rf main

exec: main
	./main

make: clean main exec