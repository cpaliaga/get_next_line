# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: caliaga- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/14 18:10:29 by caliaga-          #+#    #+#              #
#    Updated: 2022/12/14 18:21:53 by caliaga-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR = ./
SRC_FILES = get_next_line.c get_next_line_utils.c 
SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))

TEST_DIR = test/
TEST_FILES = main_gnl.c
TEST = $(addprefix $(TEST_DIR), $(TEST_FILES))

INC_DIR = ./
INC_FILES = get_next_line.h
LIB = $(addprefix $(INC_DIR), $(INC_FILES))

OBJ = $(subst .c,.o,$(SRC))

CFLAGS = -Wall -Wextra -Werror
BUF = -D BUFFER_SIZE=42
NAME = libgnl.a  
EXEC = gnl.exe
HIDE = .
#### REGLAS ####
all: $(NAME)

$(NAME): $(OBJ)
	ar crs $(NAME) $(OBJ)
	ranlib $(NAME)
	echo "library $(NAME) created & indexed"

$(filter-out %.o, $(SRC)): $(filter-out %.c, $(SRC))
	gcc $(CFLAGS) -I$(INC_DIR) -c $^ -o $@

ex: $(NAME)
	gcc $(CFLAGS) $(TEST) -L -lgnl -o $(EXEC)

clean:
	rm -fr $(SRC:.c=.o)
	echo "OBJECTS deleted"

fclean: clean
	@rm -fr $(NAME)
	@echo "$(NAME) deleted"

re: fclean all bonus

.PHONY: all ex clean fclean re

# https://medium.com/@eightlimbed/how-to-create-and-use-a-c-static-library-eec33d502aeb
