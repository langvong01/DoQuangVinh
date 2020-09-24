#include<stdio.h>
void main()
{
	int i=1,j=0,m,k;
	printf("Fibonaci\n");
	printf("( ");
	for(m=0;m<4;m++)
	{
		i+=j;
		printf("%d,",i);
		for(k=0;k<1;k++)
		{	
		j+=i;
			if (j==21) continue;
		printf("%d,",j);
		}		
	}
printf("....)");
}
