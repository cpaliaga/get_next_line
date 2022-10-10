SRC = get._next_line.c get_next_line_utils.c
OBJ = ${SRC: .c=.o}
INCLUDE = -I ./
LIBS = get_next_line.h
CC = gcc
CFLAGS = -Wall -Wextra -Werror
NAME = GNL.exe

all: ${NAME}
 
${NAME}:


