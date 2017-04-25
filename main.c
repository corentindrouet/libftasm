#include <stdio.h>
#include <string.h>
#define BZERO_TEST 0
#define STRCAT_TEST 1

extern void	ft_bzero(void *str, int a);
extern void	ft_strcat(void *str1, void *str2);

void	test_bzero()
{
	char	str[250] = "essai";

	if (!BZERO_TEST)
		return ;
	ft_bzero(str, 250);
	if (!strcmp(str, "essai"))
		printf("str should be empty\n");
	strcpy(&str[10], "essai");
	ft_bzero(str, 10);
	if (strcmp(&str[10], "essai"))
		printf("str[10] should not be 0\n");
}

void	test_strcat()
{
	char	str1[40] = "essai";
	char	str2[40] = "";

	if (!STRCAT_TEST)
		return ;
	ft_strcat(str1, str2);
	if (strcmp(str1, "essai"))
		printf("str should have been concatened\n");
}

int main(void)
{
	test_bzero();
	test_strcat();
	return (0);
}
