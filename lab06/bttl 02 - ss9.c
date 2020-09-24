#include<stdio.h>
void main()
{
	int num1,num2,res1,res2,i,j,sum=0;
	printf("Enter a num1 :\n");
	scanf("%d",&num1);
	res1=num1% 2;
	printf("Enter a num2 :\n");
	scanf("%d",&num2);
	res2=num2% 2;
	printf("\nSo cac so le nam giua 2 so la:\n");		
	if((res1==0 && res2==0)||(res1==0 || res2==0))
	{
	
		for(i=0;i<(num2-num1)/2;i++)
		{
		printf("So le thu %d:\n",i+1);
		scanf("%d",&j);
		sum+=j;
	
		}
	}else
		for(i=0;i<(num2-num1)/2-1;i++)
		{
		printf("So le thu %d:\n",i+1);
		scanf("%d",&j);
		sum+=j;
	
		}
	printf("\nSum of numbers is: %d",sum);	
	
}
