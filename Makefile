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

INC_DIR = ./
INC_FILES = get_next_line.h
LIB = $(addprefix $(INC_DIR), $(INC_FILES))

OBJ = $(subst .c,.o,$(SRC))

CFLAGS = -Wall -Wextra -Werror -D BUFFER_SIZE=42
NAME =   
HIDE = .
#### REGLAS ####
all: $(NAME)

bonus: &(HIDE)$(NAME)

&(HIDE): $(OBJ) $(OBJ_B)
	ar crs $(NAME) $(OBJ) $(OBJ_B)
	ranlib $(NAME)
	echo "library $(NAME) plus bonus created & indexed"

$(filter-out %.o, $(BONUS)): $(filter-out %.c, $(BONUS))
gcc $(CFLAGS) -I$(INC_DIR) -c $^ -o $@

$(NAME): $(OBJ)
	ar crs $(NAME) $(OBJ)
	ranlib $(NAME)
	echo "library $(NAME) created & indexed"

$(filter-out %.o, $(SRC)): $(filter-out %.c, $(SRC))
	gcc $(CFLAGS) -I$(INC_DIR) -c $^ -o $@

clean:
	rm -fr $(SRC:.c=.o) $(BONUS:.c=.o)
	echo "OBJECTS deleted"

fclean: clean
	@rm -fr $(NAME)
	@echo "$(NAME) deleted"

re: fclean all bonus

.PHONY: bonus all clean fclean re

