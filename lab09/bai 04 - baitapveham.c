#include <stdio.h>
#include <math.h>
int main()
{
	int	arr[10];
	int i;j
	int n,count;
	printf("Enter a number of value :");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		printf("\nEnter value of number%d :",i+1);
		scanf("%d",&arr[i]);
	}
checkarr(arr,10);
	for(j=0;j<n;j++)
	{
		if
	}
}
checkarr(int *arr,int size)
{
	int num,count = 0;
	int j;
	int num = 5;
	if(num<2){
	
		printf("\n%d khong phai la so nguyen to",num);
		return 0;
			}
	for(j=2;j<=sqrt(num);j++)
		{
			if(num%j==0){
				count++;
			}
		}
	 if (count == 0)
	{
		printf("\n%d la so nguyen to",num);
	}
	else{
		printf("\n%d khong phai la so nguyen to",num);
	}
	
}



