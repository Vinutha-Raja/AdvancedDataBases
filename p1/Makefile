ifdef D
   OPT= -g
else
   OPT= -g -flto -Ofast
endif

CC = gcc
CPP = g++
CFLAGS = $(OPT) -Wall -march=native -pthread 
INCLUDE = -I ./include
SOURCES = src/iceberg_table.c src/hashutil.c src/partitioned_counter.c src/lock.c
OBJECTS = $(subst src/,obj/,$(subst .c,.o,$(SOURCES)))
LIBS = -lssl -lcrypto 

all: main 

obj/%.o: src/%.c
	@ mkdir -p obj
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

obj/main.o: main.cc
	@ mkdir -p obj
	$(CPP) $(CFLAGS) $(INCLUDE) -c $< -o $@

main: $(OBJECTS) obj/main.o
	$(CPP) $(CFLAGS) $^ -o $@ $(LIBS)

.PHONY: clean directories

clean:
	rm -f main $(OBJECTS) obj/main.o
