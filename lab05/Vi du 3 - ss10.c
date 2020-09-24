#include<stdio.h>
#include<conio.h>
void main()
{
	int cnt = 0,num;
	do
	{
		printf("\n Enter a Number :");
		scanf("%d",&num);
		printf("No.is %d",num);
		cnt++;
	} while (num!=0);
	printf("\nThe total number entered were %d",--cnt);
}

