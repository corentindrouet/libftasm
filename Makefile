# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cdrouet <cdrouet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/01/04 13:04:33 by cdrouet           #+#    #+#              #
#    Updated: 2017/04/25 10:19:09 by cdrouet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a
SRC = ft_bzero.s \
	  ft_strcat.s \

BIN = $(SRC:.s=.o)
NASM=~/.brew/bin/nasm
NASM_FLAGS= -f macho64
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
	@$(NASM) $(NASM_FLAG) -o $@ -c $<

all : $(NAME)

clean :
	$(info Cleaning binaries...)
	@rm -f $(BIN)
	$(info Done !)

fclean : clean
	$(info Cleaning library...)
	@rm -f $(NAME)
	$(info Done !)

re : fclean all
