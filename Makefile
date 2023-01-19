# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: caliaga- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/14 18:10:29 by caliaga-          #+#    #+#              #
#    Updated: 2023/01/19 12:28:32 by caliaga-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR = ./
SRC_FILES = get_next_line.c get_next_line_utils.c 
SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))

BONUS_DIR = ./
BONUS_FILES = get_next_line_bonus.c get_next_line_utils_bonus.c 
BONUS = $(addprefix $(BONUS_DIR), $(BONUS_FILES))

TEST_DIR = tester_get_next_line/
TEST_A = basic_gnl.c
TEST = $(addprefix $(TEST_DIR), $(TEST_A))

INC_D = ./
INC_H = get_next_line.h
LIB = ./

OBJ = $(subst .c,.o,$(SRC))
CFLAGS = -Wall -Wextra -Werror
BUF = -D BUFFER_SIZE=42

NAME = libgnl.a
EXEC = test_gnl
HIDE = .

#### REGLAS ####
all: $(NAME)

$(NAME): $(OBJ)
	@ar crs $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "library $(NAME) created & indexed"

$(filter-out %.o, $(SRC)): $(filter-out %.c, $(SRC))
	@gcc $(CFLAGS) -I$(INC_D) -c $^ -o $@

ex: $(NAME)
	@gcc $(CFLAGS) $(TEST) -L$(LIB) -lgnl -o $(EXEC)

clean:
	@rm -fr $(SRC:.c=.o)
	@echo "OBJECTS deleted"

fclean: clean
	@rm -fr $(NAME)
	@echo "$(NAME) deleted"

re: fclean all ex

.PHONY: all ex clean fclean re
