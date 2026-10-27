CC = cc
CFLAGS = -Wall -Wextra -Werror

PROGRAMS = Colleen Grace Sully
OBJECTS = $(PROGRAMS:=.o)

all: $(PROGRAMS)

$(PROGRAMS): %: %.o
	$(CC) $(CFLAGS) $(LDFLAGS) $< $(LDLIBS) -o $@

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) Grace_kid.c Sully_[0-9]*.c Sully_[0-9]*.o

fclean: clean
	$(RM) $(PROGRAMS) Sully_[0-9]*

re: fclean
	$(MAKE) all

.PHONY: all clean fclean re
