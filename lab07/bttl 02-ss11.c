#include<stdio.h>
int main()
{
	int arr[5];
	int  i;
	for(i=0;i<5;i++)
	{
		printf("\nEnter the value %d : ",i+1);
		scanf("%d",&*(arr+i));
	}
	printf("\nDao nguoc mang");
	for(i=4;i>=0;i--)
	{
		printf("\n the value %d : is %d ",i+1,*(arr+i));
	}
}
