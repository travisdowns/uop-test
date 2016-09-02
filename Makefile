.PHONY: all run-skylake

all: uop-test run-skylake

uop-test: uop-test.o
	ld uop-test.o -o uop-test

uop-test.o: uop-test.s
	yasm -f elf64 uop-test.s

run-skylake:
	./run-skylake.sh

