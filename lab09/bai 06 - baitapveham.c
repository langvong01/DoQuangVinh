#include <stdio.h>
#include	<string.h>
void upper_case(char name_s[]);
int main()
{
	char s [30];
	gets(s);
	upper_case(s);
	printf("\nDisplay the string in uppercase :\n %s",s);
	
}
void upper_case(char name_s[])
{
	int	i;
	for	(i=0;name_s[i] != '\0';i++)
		{
			if(name_s[i]>=97 && name_s[i]<=122)
				name_s[i]=name_s[i]-32;
		}
	
}
