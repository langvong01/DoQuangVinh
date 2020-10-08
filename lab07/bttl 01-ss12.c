#include<stdio.h>
void main()
{
	int ary[5],i;
	int max = ary[0],min= ary[0] , avg , sum=0;
	printf("Enter a arry of numbers : \n");
	for(i=0;i<5;i++)
	{
		scanf("%d",&ary[i]);
		sum+=ary[i];
		if(ary[i]>max)
			{
			
			max = ary[i];	
			}else max = max;
		if (ary[i]<min)
			{
			min = ary[i];
			}else min = min;
	
	}		
	printf("\nSum value enter was %d",sum);
	printf("\nHightest value enter was %d",max);
	printf("\nLowest value enter was %d",min);
	printf("\nAverage value enter was %d",sum/5);
}
