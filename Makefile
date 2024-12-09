NAME = pipex

SRCS = pipex.c utils.c
LIBFT_DIR = Libft
LIBFT = $(LIBFT_DIR)/libft.a

OBJS = $(SRCS:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

RM = rm -rf

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJS) $(LIBFT) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJS)
	$(RM) $(LIBFT_DIR)/*.o

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBFT)

re: fclean all

$(LIBFT):
	make -C $(LIBFT_DIR)

.PHONY: all clean fclean re 