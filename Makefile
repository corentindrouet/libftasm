# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cdrouet <cdrouet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/01/04 13:04:33 by cdrouet           #+#    #+#              #
#    Updated: 2017/04/28 14:24:34 by cdrouet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a
SRC = ft_bzero.s \
	  ft_strcat.s \
	  ft_isalpha.s \
	  ft_isdigit.s \
	  ft_isalnum.s \
	  ft_isascii.s \
	  ft_isprint.s \
	  ft_toupper.s \
	  ft_tolower.s \
	  ft_puts.s \
	  ft_strlen.s \
	  ft_memset.s \
	  ft_memcpy.s \
	  ft_strdup.s \
	  ft_cat.s \
	  ft_putnbr.s \
	  ft_strjoin.s
TEST_SRC= main.c
TEST_NAME=test_asm
BIN = $(SRC:.s=.o)
NASM=~/.brew/bin/nasm
NASM_FLAG= -f macho64
BIN_PATH=./
SRC_PATH=./
FLAG = -Wall -Wextra -Werror
$(NAME) : $(BIN)
	$(info Done !)
	$(info Compiling library...)
	@ar rc $(NAME) $(BIN) ; ranlib $(NAME)
	$(info Done !)

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	@/bin/echo -n "."
	@$(NASM) $(NASM_FLAG) -o $@ $<

all : $(NAME)

test: $(NAME)
	clang -o $(TEST_NAME) $(FLAG) $(TEST_SRC) -L. -lfts
	./$(TEST_NAME)

clean :
	$(info Cleaning binaries...)
	@rm -f $(BIN)
	$(info Done !)

fclean : clean
	$(info Cleaning library...)
	@rm -f $(NAME) $(TEST_NAME)
	$(info Done !)

re : fclean all
