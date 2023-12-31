
CC=clang
CFLAGS=-g -Wall

SRC=src
OBJ=obj
BINDIR=bin

SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

BIN=$(BINDIR)/main
SUBMITNAME=project_say_hi.tar.gz

all:$(BIN)


relase: CFLAGS=-Wall -O2 -DNDEBUG
relase: clean
relase: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BINDIR)/* $(OBJ)/*

submit:
	$(RM) $(SUBMITNAME)
	tar cvf $(SUBMITNAME) $(BIN)
