NASM = nasm
NASMFLAGS = -f elf64
CC = cc
LDFLAGS = -no-pie -Wl,-z,noexecstack

PROGRAMS = Colleen Grace Sully
OBJECTS = $(PROGRAMS:=.o)

all: $(PROGRAMS)

$(PROGRAMS): %: %.o
	$(CC) $(LDFLAGS) $< $(LDLIBS) -o $@

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJECTS) Grace_kid.s Sully_[0-9]*.s Sully_[0-9]*.o

fclean: clean
	$(RM) $(PROGRAMS) Sully_[0-9]*

re: fclean
	$(MAKE) all

.PHONY: all clean fclean re
