#include <stdio.h>
int main()
{
	int arr[10];
	int min = 0;
	int i=0;
	Min(arr,10);
	if(min<arr[i])
		min = arr[i];
	printf("\nDisplay a value min: %d",min);
	
}
Min(int *arr, int size)
{
	int i;

	for(i=0;i<10;i++)
	{
		printf("\nEnter a value of number %d :",i+1);
		scanf("%d",&arr[i]);
	}	
}



