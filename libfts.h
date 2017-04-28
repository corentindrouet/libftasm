/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cdrouet <cdrouet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/04/27 08:35:19 by cdrouet           #+#    #+#             */
/*   Updated: 2017/04/28 08:54:40 by cdrouet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H
# include <stdio.h>

extern void		ft_bzero(void *s, size_t n);
extern char		*ft_strcat(char *restrict str1, char *restrict str2);
extern int		ft_isalpha(int c);
extern int		ft_isdigit(int c);
extern int		ft_isalnum(int c);
extern int		ft_isascii(int c);
extern int		ft_isprint(int c);
extern int		ft_toupper(int c);
extern int		ft_tolower(int c);
extern int		ft_puts(char *c);
extern size_t	ft_strlen(const char *c);
extern void		*ft_memset(void *b, int c, size_t len);
extern void		*ft_memcpy(void *dst, void *src, size_t n);
extern char		*ft_strdup(const char *s1);
extern void		ft_cat(int fd);
extern void		ft_putnbr(int nb);

#endif
