ifeq ($(BIN),TRUE)
	CC=ocamlopt
else
	CC=ocamlc
endif

ifeq ($(RELEASE),TRUE)
	FLAGS=-s
else
	FLAGS=-g -bin-annot -w A -color always
endif

all : bin/ack.out

bin/ack.out : obj/main.o obj/ack.o
	$(CC) $(FLAGS) -o $@ $^

obj/main.o : src/main.ml
	$(CC) $(FLAGS) -c -o $@ $<

obj/ack.o : src/ack.ml interface/ack.mli
	$(CC) $(FLAGS) -c -o $@ $<

clean :
	rm -f bin/ack.out
	rm -f obj/*.o

install :
	cp bin/ack.out /usr/local/bin/ack