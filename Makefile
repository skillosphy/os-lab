CC = gcc # compiler to use
CFLAGS = -Wall -g #compiler flags -Wall enables all std warnings 
# -g includes debug info

#Core rule structure:
#target: dependencies  
#		 command
# target is the file to create, pre req dependencies
# command the exact shell cmd to run

all: app_static app_shared

mylib.o: mylib.c mylib.h
	$(CC) $(CFLAGS) -fPIC -c mylib.c

libmylib.a: mylib.o
	ar rcs libmylib.a mylib.o

libmylib.so: mylib.o
	$(CC) -shared mylib.o -o libmylib.so

app_static: main.c libmylib.a
	$(CC) $(CFLAGS) main.c libmylib.a -o app_static

app_shared: main.c libmylib.so
	$(CC) $(CFLAGS) main.c -L. -lmylib -Wl,-rpath,. -o app_shared

clean:
	rm -f *.o *.a *.so app_static app_shared


