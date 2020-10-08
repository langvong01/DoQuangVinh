#include <stdio.h>
#include<string.h>
void main()
{
	char compname [20] = "Microsoft";
	int len,i;
	len = strlen(compname);
	for(i=0;i<len;i++)
		printf("%c*",compname[i]);
		getch();
}
