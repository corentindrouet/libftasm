#include <stdio.h>
#include <string.h>
#include <ctype.h>
#define BZERO_TEST 1
#define STRCAT_TEST 1
#define ISALPHA_TEST 1

extern void	ft_bzero(void *str, int a);
extern char	*ft_strcat(void *str1, void *str2);
extern int	ft_isalpha(int c);
extern int	ft_isdigit(int c);
extern int	ft_isalnum(int c);
extern int	ft_isascii(int c);
extern int	ft_isprint(int c);

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
		printf("\tstr should have been concatened\n");
	else
		printf("\ttest 1: OK\n");
	strcpy(str2, "truc");
	ptr = ft_strcat(str1, str2);
	if (ptr != str1 || strcmp(str1, "essaitruc"))
		printf("\tstr should have been concatened\n");
	else
		printf("\ttest 2: OK\n");
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
	return (0);
}
