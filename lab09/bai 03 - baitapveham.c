#include <stdio.h>
#include <math.h>
int main()
{
	int num;
	//printf("Enter a value of number :");
	//scanf("%d",&num);
	checknumber(num);
}
checknumber(i)
{
	int num,count = 0;
	int j;
	printf("\nEnter a value of number :");
	scanf("%d",&num);
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


