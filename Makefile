ifneq ($(RELEASE),TRUE)
	FLAGS=-g -bin-annot -w A -color always
endif

all : bin/ack.native bin/ack.byte

bin/ack.byte : ack.ml
	ocamlc $(FLAGS) -o $@ $^
	rm -v -f *.cmo *.cmi *.cmx *.o *.annot *.cmt *.o

bin/ack.native : ack.ml
	ocamlopt $(FLAGS) -o $@ $^
	rm -v -f *.cmo *.cmi *.cmx *.o *.annot *.cmt *.o

clean :
	rm -f -v bin/ack.*
	rm -v -f *.cmo *.cmi *.cmx *.o *.annot *.cmt *.o

install :
	make RELEASE=TRUE bin/ack.native
	cp bin/ack.native /usr/local/bin/ack