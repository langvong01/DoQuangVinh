#include<stdio.h>
void main()
{
	char a, str[81], *ptr;
	printf("\nEnter a sentence:");
	gets(str);
	printf("\nEnter character to search for:");
	a = getchar();
	 ptr = strchr (str,a);
	 /* return pointer to char */
	 printf("\nString starts at address : %u",str);
	 printf("\nFirst occurrence of the character is at address: %u",ptr);
	 printf("\n Posotion of first occurrence (starting from 0) is: %d",ptr-str);
}
