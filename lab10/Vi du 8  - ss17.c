#include <stdio.h>
#include<string.h>
int sum_arr(int num_arr[]);
void main()
{
	int num[5],ctr,sum=0;
	for (ctr=0;ctr<5;ctr++)
	{
		printf("\nEnter number %d:",ctr+1);
		scanf("%d",&num[ctr]);
	}
	sum = sum_arr(num);
	printf("\nThe sum of the array is %d",sum);	
}
	int sum_arr(int num_arr[])
	{
		int i,total;
		for(i=0,total=0;i<5;i++)
			total +=num_arr[i];
		return total;
	}
