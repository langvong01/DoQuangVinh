#include<stdio.h>
void main()
{
	int i,k;
	printf("(a)");
		for(i=0;i<5;i++)
	{
			printf("\n");
		for(k=0;k<=i;k++)
			{
				printf("%d",k+1);
			}	
	}

	printf("\n(b)");
		for(i=5;i>0;i--)
	{
			printf("\n");
		for(k=0;k<i;k++)
		{
			printf("%d",k+1);
		}
	}	
}
