# target ... : prerequisites ...0
# 	recipe
# 	...

SRCDIR = src
TESTDIR = test
PWD = `pwd`
	
objects = ServerCountThrees.o readInt32BitLE.o

ServerCountThrees : $(objects)
	cc -o ServerCountThrees $(objects)

ServerCountThrees.o : src/ServerCountThrees.c src/readInt32BitLE.h
	cc -c src/ServerCountThrees.c
readInt32BitLE.o : src/readInt32BitLE.c src/readInt32BitLE.h
	cc -c src/readInt32BitLE.c

	
test :
	mkdir test
	mv ServerCountThrees test
	cp -p src/threesData.bin test
	cd test && ./ServerCountThrees 
	cd $(PWD)

clean :
	rm $(objects)
	rm -rf $(TESTDIR)
	rm ServerCountThrees