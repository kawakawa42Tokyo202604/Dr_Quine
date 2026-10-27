GO = go
GOFLAGS =

PROGRAMS = Colleen Grace Sully

all: $(PROGRAMS)

$(PROGRAMS): %: %.go
	$(GO) build $(GOFLAGS) -o $@ $<

clean:
	$(RM) Grace_kid.go Sully_[0-9]*.go

fclean: clean
	$(RM) $(PROGRAMS) Sully_[0-9]*

re: fclean
	$(MAKE) all

.PHONY: all clean fclean re
