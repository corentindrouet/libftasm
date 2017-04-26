/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cat.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cdrouet <cdrouet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/04/26 14:30:59 by cdrouet           #+#    #+#             */
/*   Updated: 2017/04/26 14:46:24 by cdrouet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

extern void	ft_cat(int fd);

int main(int argc, const char **argv)
{
	int fd;

	if (argc <= 1)
		return (0);
	if (argv[1][0] == '0' || argv[1][0] == '1')
	{
		fd = argv[1][0] - '0';
		ft_cat(fd);
	}
	else
	{
		fd = open(argv[1], O_RDONLY);
		if (fd == -1)
			printf("nop");
		ft_cat(fd);
		close(fd);
	}
	return (0);
}
