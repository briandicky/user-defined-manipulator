CC = g++
CFLAGS = -c -Wall -O2 -std=c++0x
CXXFLAGS = $(CFLAGS)
RM = rm
FORCE = -f
LDFLAGS =
SOURCES = form.cpp
OBJECTS = $(SOURCES:.cpp=.o)
EXECUTABLE = form

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CXXFLAGS) $< -o $@

dep:
	$(CC) -M *.cpp > .depend

clean:
	$(RM) $(FORCE) $(OBJECTS) $(EXECUTABLE) .depend 

help:
	@echo "This is makefile command information:"
	@echo "==============================================="
	@echo "all = compile all the file."
	@echo "DEBUG = enable the debugger mode."
	@echo "clean = remove executable and object file."
	@echo "==============================================="
	@echo 'Just use "make (FLAG)" then pass argument to make command.'
	@echo ""
