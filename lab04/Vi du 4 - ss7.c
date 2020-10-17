#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	char c ; 
	printf("Please enter a character : ");
	scanf("%c",&c);
	if (c>='A' && c <='Z')
		printf("Lowercase character = %c",c+ 'a'-'A');
	else
		printf("Lowercase Entered is = %c",c);
}
