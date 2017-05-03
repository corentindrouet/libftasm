#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include "libfts.h"
#define BZERO_TEST 1
#define STRCAT_TEST 1
#define ISALPHA_TEST 1

void	test_ft_cat()
{
	int fd;

	fd = open("Makefile", O_RDONLY);
	ft_cat(fd);
	close(fd);
}

void	test_ft_strdup()
{
	char str[10] = "essai";
	char	*ptr = NULL;

	printf("FT_STRDUP TESTS:\n");
	ptr = ft_strdup(str);
	if (!ptr)
		printf("\tempty ptr\n");
	else if (ptr == str)
		printf("\tno allocations have been done\n");
	else if (strcmp(ptr, str))
		printf("\tthe strings are differents: _ft:%s, std:%s\n", ptr, str);
	else
		printf("\ttest1: OK\n");
	free(ptr);
	ptr = ft_strdup("");
	if (!ptr)
		printf("\tempty ptr\n");
	else if (ptr == str)
		printf("\tno allocations have been done\n");
	else if (strcmp(ptr, ""))
		printf("\tthe strings are differents: _ft:%s, std:%s\n", ptr, str);
	else
		printf("\ttest2: OK\n");
	ft_strdup(NULL);
	printf("\tNULL ptr OK\n");
}

void	test_ft_memcpy()
{
	char str[10] = "essai";
	char str2[10] = "bonjour";
	char str3[10] = "essai";
	char str4[10] = "bonjour";
	char	*ptr1;
	char	*ptr2;

	ptr1 = ft_memcpy(str, str2, 4);
	ptr2 = memcpy(str3, str4, 4);
	printf("FT_MEMCPY TESTS:\n");
	if (ptr1 == str && !strcmp(ptr1, ptr2))
		printf("\ttest1: OK\n");
	else
		printf("\ttest1:fail - ft_%s, std:%s\n", ptr1, ptr2);
	ptr1 = ft_memcpy(str, str2, 0);
	ptr2 = memcpy(str3, str4, 0);
	if (ptr1 == str && !strcmp(ptr1, ptr2))
		printf("\ttest2: OK\n");
	else
		printf("\ttest2:fail - ft_%s, std:%s\n", ptr1, ptr2);
	ptr1 = ft_memcpy(str, str2, 10);
	ptr2 = memcpy(str3, str4, 10);
	if (ptr1 == str && !strcmp(ptr1, ptr2))
		printf("\ttest3: OK\n");
	else
		printf("\ttest3:fail - ft_%s, std:%s\n", ptr1, ptr2);
	ft_memcpy(NULL, NULL, 13421);
	printf("\tNULL ptr OK\n");
}

void	test_ft_memset()
{
	char	str[10] = "bonjour";
	char	str2[10] = "bonjour";

	printf("FT_MEMSET TESTS:\n");
	if (!strcmp(ft_memset(str, 'a', 5), memset(str2, 'a', 5)))
		printf("\ttest1: OK\n");
	else
		printf("\ttest1: fail - ft_:%s, std:%s\n", str, str2);
	strcpy(str, "i");
	strcpy(str2, "i");
	if (!strcmp(ft_memset(str, 'a', 0), memset(str2, 'a', 0)))
		printf("\ttest2: OK\n");
	else
		printf("\ttest2: fail - ft_:%s, std:%s\n", str, str2);
	ft_memset(NULL, 'q', 1234);
	printf("\tNULL ptr OK\n");
}

void	test_ft_strlen()
{
	char	str[10] = "";

	printf("FT_STRLEN TESTS:\n");
	if (ft_strlen(str) == strlen(str))
		printf("\ttest1: OK\n");
	else
		printf("\ttest1: fail -  ft_:%ld, std:%ld\n", ft_strlen(str), strlen(str));
	strcpy(str, "bonjour");
	if (ft_strlen(str) == strlen(str))
		printf("\ttest2: OK\n");
	else
		printf("\ttest2: fail -  ft_:%ld, std:%ld\n", ft_strlen(str), strlen(str));
	ft_strlen(NULL);
	printf("\tNULL ptr OK\n");
}

void	test_ft_puts()
{
	char re[10] = "bonjour";
	ft_puts(re);
	ft_puts(NULL);
	printf("\tNULL ptr OK\n");
}

void	test_tolower()
{
	int	c;
	int	nb_false;

	printf("FT_TOLOWER TESTS:\n");
	c = -1;
	nb_false = 0;
	while (++c < 128)
		if (ft_tolower(c) != tolower(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for 0 to 127: OK\n");
	else
		printf("\ttest for 0 to 127: %d fails\n", nb_false);
}

void	test_toupper()
{
	int	c;
	int	nb_false;

	printf("FT_TOUPPER TESTS:\n");
	c = -1;
	nb_false = 0;
	while (++c < 128)
		if (ft_toupper(c) != toupper(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for 0 to 127: OK\n");
	else
		printf("\ttest for 0 to 127: %d fails\n", nb_false);
}

void	test_isprint()
{
	int	c;
	int	nb_false;

	printf("FT_ISPRINT TESTS:\n");
	c = 0;
	nb_false = 0;
	while (++c < 128)
		if (ft_isprint(c) != isprint(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for 0 to 127: OK\n");
	else
		printf("\ttest for 0 to 127: %d fails\n", nb_false);
}

void	test_isascii()
{
	int	c;
	int	nb_false;

	printf("FT_ISASCII TESTS:\n");
	c = -100;
	nb_false = 0;
	while (++c < 200)
		if (ft_isascii(c) != isascii(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for -100 to 200: OK\n");
	else
		printf("\ttest for -100 to 200: %d fails\n", nb_false);
}

void	test_isalnum()
{
	int	c;
	int	nb_false;

	printf("FT_ISALNUM TESTS:\n");
	c = -1;
	nb_false = 0;
	while (++c < 128)
		if (ft_isalnum(c) != isalnum(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for 0 to 127: OK\n");
	else
		printf("\ttest for 0 to 127 have %d fails\n", nb_false);
}

void	test_isdigit()
{
	int	c;
	int	nb_false;

	printf("FT_ISDIGIT TESTS:\n");
	c = -1;
	nb_false = 0;
	while (++c < 128)
		if (ft_isdigit(c) != isdigit(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for 0 to 127: OK\n");
	else
		printf("\ttest for 0 to 127 have %d fails\n", nb_false);
}

void	test_isalpha()
{
	int	c;
	int	nb_false;

	printf("FT_ISALPHA TESTS:\n");
	c = -1;
	nb_false = 0;
	while (++c < 128)
		if (ft_isalpha(c) != isalpha(c))
			nb_false++;
	if (nb_false == 0)
		printf("\ttest for 0 to 127: OK\n");
	else
		printf("\ttest for 0 to 127 have %d fails\n", nb_false);
}

void	test_bzero()
{
	char	str[250] = "essai";

	if (!BZERO_TEST)
		return ;
	printf("FT_BZERO TESTS:\n");
	ft_bzero(str, 250);
	if (!strcmp(str, "essai"))
		printf("\tstr should be empty\n");
	else
		printf("\ttest 1: OK\n");
	strcpy(&str[10], "essai");
	ft_bzero(str, 10);
	if (strcmp(&str[10], "essai"))
		printf("\tstr[10] should not be 0\n");
	else
		printf("\ttest 2: OK\n");
	ft_bzero(NULL, 194837245);
	printf("\tNULL ptr OK\n");
}

void	test_strcat()
{
	char	str1[40] = "essai";
	char	str2[40] = "";
	char	*ptr;

	if (!STRCAT_TEST)
		return ;
	printf("FT_STRCAT TESTS:\n");
	ptr = ft_strcat(str1, str2);
	if (ptr != str1 || strcmp(str1, "essai"))
		printf("\tstr should have been concatened: %s\n", str1);
	else
		printf("\ttest 1: OK\n");
	strcpy(str2, "truc");
	ptr = ft_strcat(str1, str2);
	if (ptr != str1 || strcmp(str1, "essaitruc"))
		printf("\tstr should have been concatened: %s\n", str1);
	else
		printf("\ttest 2: OK\n");
	ft_strcat(NULL, NULL);
	printf("\tNULL ptr OK\n");
}

int main(void)
{
	test_bzero();
	test_strcat();
	test_isalpha();
	test_isdigit();
	test_isalnum();
	test_isascii();
	test_isprint();
	test_toupper();
	test_tolower();
	test_ft_puts();
	test_ft_strlen();
	test_ft_memset();
	test_ft_memcpy();
	test_ft_strdup();
	test_ft_cat();
	return (0);
}
