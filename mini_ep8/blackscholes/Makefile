OUTPUT=bs

CC=gcc
CC_OPT=-std=c11

CC_OMP=-fopenmp

.PHONY: all
all: $(OUTPUT)

$(OUTPUT): $(OUTPUT).c
	$(CC) -o $(OUTPUT) $(CC_OPT) $(CC_OMP) $(OUTPUT).c -lm

.PHONY: clean
clean:
	rm $(OUTPUT)
