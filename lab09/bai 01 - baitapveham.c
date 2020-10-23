#include <stdio.h>
void printArray(int arry[],int size)
{
	int i;
	for(i=4;i>=0;i--)
	{
		printf("\n");
		printf("%d",arry[i]);
	}
}
int main1()
{
	int arry[5];
	int i;
	for(i=0;i<5;i++)
	{
		printf("Enter a value of number %d :",i+1);
		scanf("%d",&arry[i]);
	}
	printArray(arry,5);
	return 0;
}


