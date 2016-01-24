#########################################################
# File: Makefile
# Description:
# Make all or make gameoflife
#########################################################

cxx = clang++

# -std=c++0x specifies to use a certain language version.
cxxflags = -std=c++14

# Turn on all warnings.
cxxflags += -Wall

# Treat errors as warnings.
cxxflags += -Werror

# -pedantic-errors strictly enforces the standard
#CXXFLAGS += -pedantic-errors

# -g turns on debug information
cxxflags += -g

program_1 = vigenere_plus_plus 
programs = $(PROG1)

source_1 = vigenere.cpp
source_main = main.cpp 
sources = $(source_1) $(source_main) 

header_1 = header.hpp
header_2 = headerr.hpp
headers = $(header_1) $(header_2) 

object_1 = vigenere.o

objects = $(OBJ2) $(OBJ3) $(OBJ4) $(OBJ5) $(OBJ6) $(OBJ7) $(OBJ8)


all: $(PROGS)

$(PROG1): $(OBJS) $(SRC_MAIN)
	$(CXX) $(CXXFLAGS) $(OBJS) $(SRC_MAIN) -o $(PROG1)

$(OBJ2): $(SRC2) $(HEADER2)
	$(CXX) $(CXXFLAGS) -c $(SRC2) 

$(OBJ3): $(SRC3) $(HEADER3)
	$(CXX) $(CXXFLAGS) -c $(SRC3)

$(OBJ4): $(SRC4) $(HEADER3)
	$(CXX) $(CXXFLAGS) -c $(SRC3)

$(OBJ5): $(SRC5) $(HEADER3)
	$(CXX) $(CXXFLAGS) -c $(SRC3)

$(OBJ6): $(SRC6) $(HEADER3)
	$(CXX) $(CXXFLAGS) -c $(SRC3)

$(OBJ7): $(SRC7) $(HEADER3)
	$(CXX) $(CXXFLAGS) -c $(SRC3)

$(OBJ8): $(SRC8) $(HEADER3)
	$(CXX) $(CXXFLAGS) -c $(SRC3)

clean:
	rm -f $(PROGS) $(OBJS)
