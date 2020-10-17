#include <stdio.h>
#include <stdlib.h>
int main(void)
{
		int i,j,max;
	printf("Please enter the maxinum value \n");
	printf("for which a table can be printed\n");
	scanf("%d",&max);
	for(i=0,j=max;i<=max;i++,j--)
		printf("\n%d +%d = %d",i,j,i+j);
}
